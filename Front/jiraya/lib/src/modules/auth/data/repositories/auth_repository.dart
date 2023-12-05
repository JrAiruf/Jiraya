import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/auth_exceptions.dart';
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
  Future<Either<AuthException, CustomerModel>> createCustomer(CreateCustomerModel newCustomer) async {
    try {
      final createdCustomerMap = await _datasource.createCustomer(newCustomer.toMap());
      final createdCustomer = CustomerModel.fromMap(createdCustomerMap);
      return right(createdCustomer);
    } on AuthException catch (e) {
      return left(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<AuthException, UserModel>> createUser(CreateUserModel newUser) async {
    try {
      final createdUserMap = await _datasource.createUser(newUser.toMap());
      final createdUser = UserModel.fromMap(createdUserMap);
      return right(createdUser);
    } on AuthException catch (e) {
      return left(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
