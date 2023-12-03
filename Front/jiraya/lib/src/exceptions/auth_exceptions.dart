// ignore_for_file: constant_identifier_names

abstract class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

final class UserCreationException extends AuthException {
  UserCreationException(String message) : super(message);
}

abstract class AuthExceptionDetails {
  static const String userNotCreated = "Não foi possível criar um novo usuário";
}
