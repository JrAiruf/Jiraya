// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jiraya/src/shared/app_colors.dart';

class IngredientsComponent extends StatelessWidget {
  const IngredientsComponent({
    Key? key,
    this.height,
    this.width,
    required this.ingredients,
  }) : super(key: key);

  final double? height;
  final double? width;
  final List<String> ingredients;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: Card(
              elevation: 10,
              color: AppColors.redPColor(context),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SizedBox(
                height: height! * 0.75,
                width: width! * 0.91,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: ingredients.isEmpty
                      ? const Center(
                          child: Text(
                            "Nenhum ingrediente adicionado",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : Wrap(
                          children: ingredients.map((ingredient) {
                            bool isTheLast = ingredients.last.contains(ingredient);
                            ingredient.padRight(ingredient.length, ", ");
                            return Text(
                              isTheLast ? ingredient : "$ingredient, ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }).toList(),
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 15,
            child: SizedBox(
              child: Card(
                elevation: 10,
                color: AppColors.yellowSColor(context),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      "Ingredientes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
