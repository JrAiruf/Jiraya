import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsController {
  final productName = TextEditingController();
  final productPrice = TextEditingController();

  final productsFormKey = GlobalKey<FormState>();
  void back() => Modular.to.pop();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, adicione ingredientes para salvar o produto";
    }
    return null;
  }
}
