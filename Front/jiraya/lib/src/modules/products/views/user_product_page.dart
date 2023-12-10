// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';
import 'package:jiraya/src/modules/products/view_models/controllers/products_controller.dart';
import 'package:jiraya/src/modules/products/views/components/ingredients_component.dart';
import 'package:jiraya/src/modules/products/views/components/product_card_component.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/shared/components/buttons/app_button.dart';

class UserProductPage extends StatefulWidget {
  const UserProductPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  @override
  State<UserProductPage> createState() => _UserProductPageState();
}

final _controller = Modular.get<ProductsController>();

class _UserProductPageState extends State<UserProductPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: _controller.back,
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.onSurfaceColor(context),
                ),
              ),
            ),
            Text(
              widget.product.name ?? "",
              style: TextStyle(
                fontSize: 35,
                color: AppColors.onSurfaceColor(context),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: ProductCardComponent(
                height: height,
                width: width,
                productImage: const AssetImage(
                  "assets/images/burguer_photo.jpg",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.product.price}",
                style: TextStyle(
                  fontSize: 35,
                  color: AppColors.onSurfaceColor(context),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: AppButton(
                onTap: () {},
                primaryColor: Colors.white,
                height: height * 0.055,
                width: width * 0.55,
                radius: 30,
                elevation: 10,
                text: "Editar",
                backgroundColor: AppColors.yellowSColor(context),
              ),
            ),
            const SizedBox(height: 40),
            IngredientsComponent(
              ingredients: widget.product.ingredients ?? [],
              height: height * 0.17,
              width: width,
            )
          ],
        ),
      ),
    );
  }
}
