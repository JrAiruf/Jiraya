// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppPropertyField extends StatelessWidget {
  const AppPropertyField({
    Key? key,
    required this.labelText,
    required this.detailColor,
    required this.controller,
    required this.inputType,
  }) : super(key: key);

  final String labelText;
  final Color detailColor;
  final TextEditingController controller;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          keyboardType: inputType,
          decoration: InputDecoration(
            label: Text(
              labelText,
              style: TextStyle(
                color: detailColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: detailColor),
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),
      ),
    );
  }
}
