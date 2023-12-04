import 'package:bloc/bloc.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/customer/models/customer_model.dart';
import 'package:meta/meta.dart';

part 'create_customer_event.dart';
part 'create_customer_state.dart';

class CreateCustomerBloc extends Bloc<CreateCustomerEvents, CreateCustomerStates> {
  CreateCustomerBloc() : super(CreateCustomerInitialState()) {
    on<CreateCustomerEvents>((event, emit) {
      // TODO: implement event handler
    });
  }
}
