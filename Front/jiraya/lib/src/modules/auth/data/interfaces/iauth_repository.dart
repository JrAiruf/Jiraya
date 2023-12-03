import 'package:dartz/dartz.dart';
import 'package:jiraya_app/src/exceptions/auth_exceptions.dart';
import 'package:jiraya_app/src/modules/auth/models/create_customer_model.dart';

abstract interface class IAuthRepository {
  Future<Either<AuthException,void>> createCustomer(CreateCustomerModel newCustomer);
}
