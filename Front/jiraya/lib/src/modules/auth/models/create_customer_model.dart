class CreateCustomerModel {
  final String fullName;
  final String phoneNumber;
  final String neighborhood;
  final String streetAddress;
  final int addressNumber;

  CreateCustomerModel({
    required this.fullName,
    required this.phoneNumber,
    required this.neighborhood,
    required this.streetAddress,
    required this.addressNumber,
  });
}
