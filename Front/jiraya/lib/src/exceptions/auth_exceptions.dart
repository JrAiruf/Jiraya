// ignore_for_file: constant_identifier_names

import 'package:jiraya/src/exceptions/base_exception.dart';

abstract class AuthException extends BaseException {
  AuthException(String message) : super(message);
}

class UserCreationException extends AuthException {
  UserCreationException(String message) : super(message);
}

abstract class AuthExceptionDetails {
  static const String userNotCreated = "Não foi possível criar um novo usuário";
}
