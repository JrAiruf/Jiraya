// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class ProductCardComponent extends StatelessWidget {
  const ProductCardComponent({
    Key? key,
    required this.height,
    required this.width,
    required this.productImage,
  }) : super(key: key);
  final double height;
  final double width;
  final ImageProvider productImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          elevation: 20,
          color: AppColors.redPColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: height * 0.4,
            width: width * 0.7,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.05),
          child: Card(
            elevation: 20,
            color: AppColors.onSecondaryColor(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: height * 0.13,
              width: width * 0.8,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.07),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: productImage,
                fit: BoxFit.fill,
              ),
            ),
            height: height * 0.35,
            width: width * 0.66,
          ),
        ),
      ],
    );
  }
}
