import 'package:jiraya/src/modules/auth/data/interfaces/app_cliente.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_datasource.dart';

class ProductDatasource implements IProductsDatasource {
  ProductDatasource(AppClient client) : _client = client;

  final AppClient _client;
  @override
  Future<Map> createProduct(Map product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }
}
