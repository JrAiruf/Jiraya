abstract interface class IAuthDatasource {
  Future<Map> createCustomer(Map newCustomer);
}
