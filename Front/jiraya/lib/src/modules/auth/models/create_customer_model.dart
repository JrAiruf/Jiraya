import 'package:jiraya/src/modules/customer/models/address_model.dart';

class CreateCustomerModel {
  String? name;
  String? phone;
  Address? address;

  CreateCustomerModel({
    this.name,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address?.toMap(),
    };
  }
}
