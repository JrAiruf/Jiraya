import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/view_models/blocs/create_product_bloc/create_product_bloc.dart';
import 'package:jiraya/src/modules/products/view_models/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:jiraya/src/modules/products/view_models/cubits/cubit/ingredients_cubit.dart';

class ProductsController {
  final productName = TextEditingController();
  final productPrice = TextEditingController();
  final ingredients = TextEditingController();

  final ingredientsCubit = Modular.get<IngredientsCubit>();
  final createProductBloc = Modular.get<CreateProductBloc>();
  final getProductBloc = Modular.get<GetProductsBloc>();
  final productsFormKey = GlobalKey<FormState>();

  void back() => Modular.to.pop();

  void saveIngredient() {
    productsFormKey.currentState?.validate();
    if (productsFormKey.currentState!.validate()) {
      ingredientsCubit.saveIngredient(ingredients.text);
      ingredients.clear();
    }
  }

  void createNewProduct() async {
    productsFormKey.currentState?.validate();
    if (productsFormKey.currentState!.validate()) {
      CreateProductModel newProduct = CreateProductModel(
        name: productName.text,
        price: double.tryParse(productPrice.text),
        ingredients: ingredientsCubit.state,
      );
      createProductBloc.add(CreateProductEvent(newProduct));
      await Future.delayed(const Duration(seconds: 1));
      clearProperties();
    }
  }

  void getAllProducts() => getProductBloc.add(GetProductsEvent());

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, preencha o campo acima.";
    }
    return null;
  }

  void clearProperties() {
    productName.clear();
    productPrice.clear();
    ingredientsCubit.state.clear();
  }

  void statusSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 4),
        content: SizedBox(
          height: 70,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
