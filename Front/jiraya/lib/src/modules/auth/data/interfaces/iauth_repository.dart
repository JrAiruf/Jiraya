import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/base_exception.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/auth/models/create_user_model.dart';
import 'package:jiraya/src/modules/customer/models/customer_model.dart';
import 'package:jiraya/src/modules/user/models/user_model.dart';

abstract interface class IAuthRepository {
  Future<Either<BaseException, CustomerModel>> createCustomer(CreateCustomerModel newCustomer);
  Future<Either<BaseException, UserModel>> createUser(CreateUserModel newUser);
}
