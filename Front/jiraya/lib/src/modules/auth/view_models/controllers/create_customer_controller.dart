import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateCustomerController {
  final customerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final neighborhood = TextEditingController();
  final streetAddress = TextEditingController();
  final addressNumber = TextEditingController();

  void back() => Modular.to.pop();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, preencha o campo acima";
    }
    return "";
  }

  String? numberValidator(String? value) {
    final number = int.tryParse(value ?? "-2");
    if (value == null || value.isEmpty) {
      return "Por favor, preencha o campo acima";
    }
    if (number == -2) {
      return "Por favor, especifique um número válido";
    }
    return "";
  }
}
