abstract class BackendData {
  static const apiUrl = "https://192.168.0.103:7162/api/";
}

abstract class ApiRoutes {
  static const createCustomer = "${BackendData.apiUrl}customers";
}
