import 'dart:convert';

import 'package:http/http.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/app_cliente.dart';
import 'package:http/http.dart' as http;

final class HttpClient implements AppClient {
  @override
  Future<Response> delete(String url, Object body) async {
    return await http.delete(Uri.parse(url), body: body);
  }

  @override
  Future<Response> get(String url) async {
    return await http.get(Uri.parse(url));
  }

  @override
  Future<Response> post(String url, Object requestBody) async {
    return await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"content-type": "application/json"});
  }

  @override
  Future<Response> put(String url, Object body) async {
    return await http.put(Uri.parse(url), body: body);
  }
}
