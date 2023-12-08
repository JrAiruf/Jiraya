import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/base_exception.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_datasource.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_repository.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/auth/models/create_user_model.dart';
import 'package:jiraya/src/modules/customer/models/customer_model.dart';
import 'package:jiraya/src/modules/user/models/user_model.dart';

final class AuthRepository implements IAuthRepository {
  AuthRepository(IAuthDatasource datasource) : _datasource = datasource;

  final IAuthDatasource _datasource;
  @override
  Future<Either<BaseException, CustomerModel>> createCustomer(CreateCustomerModel newCustomer) async {
    try {
      final createdCustomerMap = await _datasource.createCustomer(newCustomer.toMap());
      final createdCustomer = CustomerModel.fromMap(createdCustomerMap);
      return right(createdCustomer);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, UserModel>> createUser(CreateUserModel newUser) async {
    try {
      final createdUserMap = await _datasource.createUser(newUser.toMap());
      final createdUser = UserModel.fromMap(createdUserMap);
      return right(createdUser);
    } on BaseException catch (exception) {
      return left(exception);
    }
  }
}
