abstract interface class IAuthDatasource {
  Future<Map> createCustomer(Map newCustomer);
  Future<Map> createUser(Map newUser);
}
