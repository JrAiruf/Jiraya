// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';

class UserProductPage extends StatefulWidget {
  const UserProductPage({Key? key}) : super(key: key);

  @override
  State<UserProductPage> createState() => _UserProductPageState();
}

ProductModel product = Modular.args.data;

class _UserProductPageState extends State<UserProductPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
