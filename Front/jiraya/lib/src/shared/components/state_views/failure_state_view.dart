// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class FailureStateView extends StatelessWidget {
  const FailureStateView({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(color: AppColors.redPColor(context)),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Desculpe!",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 20),
          Text(
            "Um erro inesperado aconteceu: $message",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
