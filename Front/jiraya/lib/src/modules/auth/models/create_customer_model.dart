// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'neighborhood': neighborhood,
      'streetAddress': streetAddress,
      'addressNumber': addressNumber,
    };
  }

}
