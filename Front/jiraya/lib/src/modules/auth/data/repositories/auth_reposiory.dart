import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/auth_exceptions.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_repository.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/customer/models/customer_model.dart';

final class AuthRepository implements IAuthRepository {
  @override
  Future<Either<AuthException, CustomerModel>> createCustomer(CreateCustomerModel newCustomer) async {
    // TODO: implement createCustomer
    throw UnimplementedError();
  }
}
