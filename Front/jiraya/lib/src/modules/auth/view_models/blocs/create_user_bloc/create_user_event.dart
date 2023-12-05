part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserEvents {}

final class CreateUserEvent extends CreateUserEvents {
  final CreateUserModel newUser;

  CreateUserEvent(this.newUser);
}
