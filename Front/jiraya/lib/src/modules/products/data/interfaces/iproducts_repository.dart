import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';

abstract interface class IProductsRepository {
  Future<ProductModel> createProduct(CreateProductModel product);
}
