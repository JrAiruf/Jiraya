import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(color: AppColors.redPColor(context)),
      height: height,
      width: width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            "Processando...",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
