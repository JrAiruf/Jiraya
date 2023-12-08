abstract class BackendData {
  static const apiUrl = "https://192.168.0.103:7162/api/";
}

abstract class ApiRoutes {
  //USERS
  static const createCustomer = "${BackendData.apiUrl}customers";
  static const createUser = "${BackendData.apiUrl}users/new-user";
  //PRODUCTS
  static const createProduct = "${BackendData.apiUrl}products";
}
