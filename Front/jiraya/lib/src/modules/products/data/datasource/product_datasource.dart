import 'dart:convert';

import 'package:http/http.dart';
import 'package:jiraya/src/exceptions/product_exceptions.dart';
import 'package:jiraya/src/shared/services/app_cliente.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_datasource.dart';
import 'package:jiraya/src/shared/backend/backend_data.dart';

class ProductDatasource implements IProductsDatasource {
  ProductDatasource(AppClient client) : _client = client;

  final AppClient _client;
  @override
  Future<Map> createProduct(Map product) async {
    var currentData = {};
    final response = await _client.post(ApiRoutes.createProduct, product) as Response;
    if (response.statusCode == 201) {
      currentData = jsonDecode(response.body);
      final ingredients = currentData["ingredients"] as List;
      currentData["ingredients"] = ingredients.map((items) => items.toString()).toList();
      return currentData;
    } else if (response.statusCode == 400) {
      final errorMessage = response.body;
      throw ProductCreationException("${ProductExceptionDetails.productNotCreated}: $errorMessage");
    }
    return currentData;
  }

  @override
  Future<List<Map>> getAllProducts() async {
    var productsList = <Map>[];
    final response = await _client.get(ApiRoutes.getProducts) as Response;
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);
      for (var productMap in list) {
        final ingredients = productMap["ingredients"] as List;
        productMap["ingredients"] = ingredients.map((items) => items.toString()).toList();
        productsList.add(productMap);
      }
      return productsList;
    } else {
      final errorMessage = response.body;
      throw ProductsRetrieveException("${ProductExceptionDetails.productsNotRetrieved}: $errorMessage");
    }
  }
}
