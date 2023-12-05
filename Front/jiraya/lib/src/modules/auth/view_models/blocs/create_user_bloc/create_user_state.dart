part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserStates {}

final class CreateUserInitialState extends CreateUserStates {}

final class CreateUserLoadingState extends CreateUserStates {}

final class CreateUserFailureState extends CreateUserStates {
  final String message;

  CreateUserFailureState(this.message);
}

final class CreateUserSuccessState extends CreateUserStates {
  final UserModel user;

  CreateUserSuccessState(this.user);
}
