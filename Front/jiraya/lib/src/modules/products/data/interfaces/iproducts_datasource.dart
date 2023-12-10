abstract interface class IProductsDatasource {
  Future<Map> createProduct(Map product);
  Future<List<Map>> getAllProducts();
}
