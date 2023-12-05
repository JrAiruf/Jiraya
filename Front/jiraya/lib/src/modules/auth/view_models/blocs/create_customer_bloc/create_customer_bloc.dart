import 'package:bloc/bloc.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_repository.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/customer/models/customer_model.dart';
import 'package:meta/meta.dart';

part 'create_customer_event.dart';
part 'create_customer_state.dart';

class CreateCustomerBloc extends Bloc<CreateCustomerEvents, CreateCustomerStates> {
  CreateCustomerBloc(IAuthRepository repository)
      : _repository = repository,
        super(CreateCustomerInitialState()) {
    on<CreateCustomerEvent>(_mapCreateCustomerEventToState);
  }

  final IAuthRepository _repository;

  void _mapCreateCustomerEventToState(CreateCustomerEvent event, Emitter<CreateCustomerStates> state) async {
    state(CreateCustomerLoadingState());
    final result = await _repository.createCustomer(event.newCustomer);
    result.fold((left) {
      return state(CreateCustomerFailureState(left.message));
    }, (right) {
      return state(CreateCustomerSuccessState(right));
    });
  }
}
