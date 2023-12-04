// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jiraya/src/enums/user_role.dart';
import 'package:jiraya/src/modules/customer/models/address_model.dart';

class CustomerModel {
  String id;
  String name;
  String phone;
  Address address;
  UserRole role = UserRole.customer;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'address': address.toMap(),
    };
  }

  factory CustomerModel.fromMap(Map map) {
    return CustomerModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
