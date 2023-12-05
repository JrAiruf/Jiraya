import 'package:bloc/bloc.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_repository.dart';
import 'package:jiraya/src/modules/auth/models/create_user_model.dart';
import 'package:jiraya/src/modules/user/models/user_model.dart';
import 'package:meta/meta.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvents, CreateUserStates> {
  CreateUserBloc(IAuthRepository repository)
      : _repository = repository,
        super(CreateUserInitialState()) {
    on<CreateUserEvent>(_mapCreateUserEventToState);
  }

  final IAuthRepository _repository;

  void _mapCreateUserEventToState(CreateUserEvent event, Emitter<CreateUserStates> state) async {
    state(CreateUserLoadingState());
    final result = await _repository.createUser(event.newUser);
    result.fold((left) {
      return state(CreateUserFailureState(left.message));
    }, (right) {
      return state(CreateUserSuccessState(right));
    });
  }
}
