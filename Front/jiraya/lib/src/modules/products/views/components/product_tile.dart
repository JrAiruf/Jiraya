// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya/src/modules/products/models/product_model.dart";
import "package:jiraya/src/shared/app_colors.dart";
import "package:jiraya/src/shared/components/buttons/app_button.dart";

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.height,
    required this.width,
  }) : super(key: key);
  final ProductModel product;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: AppColors.tertiaryColor(context),
        child: Container(
          height: height * 0.16,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.onSurfaceColor(context),
                width: 0.5,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? "",
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "${product.price}",
                      style: const TextStyle(fontSize: 25),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.yellowSColor(context),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline),
                            color: AppColors.onSurfaceColor(context),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.yellowSColor(context),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.send),
                            color: AppColors.onSurfaceColor(context),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipOval(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/burguer_photo.jpg"), fit: BoxFit.fill),
                          ),
                          height: height * 0.064,
                          width: width * 0.14,
                        ),
                      ),
                      const Spacer(),
                      AppButton(
                        text: "Detalhes",
                        radius: 8,
                        onTap: () {
                          Modular.to.pushNamed("./user_product_page", arguments: product);
                        },
                        primaryColor: AppColors.onSurfaceColor(context),
                        height: height * 0.045,
                        width: width * 0.25,
                        backgroundColor: AppColors.yellowSColor(context),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
