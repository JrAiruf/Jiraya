import 'package:jiraya/src/modules/products/data/interfaces/iproducts_datasource.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_repository.dart';
import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';

class ProductRepository implements IProductsRepository {
  ProductRepository(IProductsDatasource datasource) : _datasource = datasource;

  final IProductsDatasource _datasource;
  @override
  Future<ProductModel> createProduct(CreateProductModel product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }
}
