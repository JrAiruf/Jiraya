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
    try {
      final response = await _client.post(ApiRoutes.createCustomer, newCustomer) as Response;
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      throw UserCreationException("${AuthExceptionDetails.userNotCreated}: $e");
    }
  }
}
