abstract class BackendData {
  static const apiUrl = "https://localhost:7162/api/";
}

abstract class ApiRoutes {
  static const createCustomer = "${BackendData.apiUrl}new-customer";
}
