// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class AppPropertyField extends StatelessWidget {
  const AppPropertyField({
    Key? key,
    required this.labelText,
    required this.detailColor,
    required this.controller,
    required this.inputType,
    required this.validator,
  }) : super(key: key);

  final String labelText;
  final Color detailColor;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor(context)),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
