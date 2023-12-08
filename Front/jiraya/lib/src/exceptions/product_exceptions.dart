// ignore_for_file: constant_identifier_names

import 'package:jiraya/src/exceptions/base_exception.dart';

abstract class ProductException extends BaseException {
  ProductException(String message) : super(message);
}

class ProductCreationException extends ProductException {
  ProductCreationException(String message) : super(message);
}

abstract class ProductExceptionDetails {
  static const String productNotCreated = "Não foi possível criar um novo produto";
}
