import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  String? id;
  String? neighborhood;
  String? streetAddress;
  int? addressNumber;
  Address({
    this.id,
    this.neighborhood,
    this.streetAddress,
    this.addressNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'neighborhood': neighborhood,
      'streetAddress': streetAddress,
      'addressNumber': addressNumber,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as String : null,
      neighborhood: map['neighborhood'] != null ? map['neighborhood'] as String : null,
      streetAddress: map['streetAddress'] != null ? map['streetAddress'] as String : null,
      addressNumber: map['addressNumber'] != null ? map['addressNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
