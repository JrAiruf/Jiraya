import 'dart:convert';
import 'package:http/http.dart';
import 'package:jiraya/src/exceptions/auth_exceptions.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/app_cliente.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_datasource.dart';
import 'package:jiraya/src/shared/backend/backend_data.dart';

final class AuthDatasource implements IAuthDatasource {
  AuthDatasource(AppClient client) : _client = client;

  final AppClient _client;
  @override
  Future<Map> createCustomer(Map newCustomer) async {
  var currentData = {};
    final response = await _client.post(ApiRoutes.createCustomer, newCustomer) as Response;
    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      currentData = responseBody;
      return currentData;
    } else if (response.statusCode == 400) {
      final errorMessage = response.body;
      throw UserCreationException("${AuthExceptionDetails.userNotCreated}: $errorMessage");
    }
    return currentData;
  }

  @override
  Future<Map> createUser(Map newUser) async {
    var currentData = {};
    final response = await _client.post(ApiRoutes.createUser, newUser) as Response;
    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      currentData = responseBody;
      return currentData;
    } else if (response.statusCode == 400) {
      final errorMessage = response.body;
      throw UserCreationException("${AuthExceptionDetails.userNotCreated}: $errorMessage");
    }
    return currentData;
  }
}
