import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/base_exception.dart';
import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';

abstract interface class IProductsRepository {
  Future<Either<BaseException, ProductModel>> createProduct(CreateProductModel product);
}
