import 'package:dartz/dartz.dart';
import 'package:jiraya/src/exceptions/base_exception.dart';
import 'package:jiraya/src/exceptions/product_exceptions.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_datasource.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_repository.dart';
import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';

class ProductRepository implements IProductsRepository {
  ProductRepository(IProductsDatasource datasource) : _datasource = datasource;

  final IProductsDatasource _datasource;
  @override
  Future<Either<BaseException, ProductModel>> createProduct(CreateProductModel product) async {
    try {
      final createdProduct = await _datasource.createProduct(product.toMap());
      if (createdProduct["id"] != null) {
        return right(ProductModel.fromMap(createdProduct));
      } else {
        return left(ProductCreationException(ProductExceptionDetails.productNotCreated));
      }
    } on BaseException catch (exception) {
      return left(exception);
    }
  }

  @override
  Future<Either<BaseException, List<ProductModel>>> getAllProducts() async {
    try {
      final list = await _datasource.getAllProducts();
      final productsList = list.map((productMap) => ProductModel.fromMap(productMap)).toList();
      return right(productsList);
    } on BaseException catch (exception) {
      return left(exception);
    }
  }
}
