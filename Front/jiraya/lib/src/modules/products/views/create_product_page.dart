import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/view_models/blocs/create_product_bloc/create_product_bloc.dart';
import 'package:jiraya/src/modules/products/view_models/controllers/products_controller.dart';
import 'package:jiraya/src/modules/products/view_models/cubits/cubit/ingredients_cubit.dart';
import 'package:jiraya/src/modules/products/views/components/ingredients_component.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/shared/components/app_property_field.dart';
import 'package:jiraya/src/shared/components/buttons/app_button.dart';
import 'package:jiraya/src/shared/components/state_views/loading_state_view.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

final _controller = Modular.get<ProductsController>();

class _CreateProductPageState extends State<CreateProductPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        backgroundColor: AppColors.redPColor(context),
        onPressed: () {},
        label: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer(
        bloc: _controller.createProductBloc,
        listener: (context, state) {
          if (state is CreateProductFailureState) {
            _controller.statusSnackBar(context, state.message, AppColors.errorColor(context));
          }
          if (state is CreateProductSuccessState) {
            Modular.to.pushReplacementNamed("./user_product_page", arguments: state.product);
          }
        },
        builder: (context, state) {
          if (state is CreateProductLoadingState) {
            return const LoadingStateView();
          }
          return SingleChildScrollView(
            child: Padding(
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
                    "Criar Novo Produto",
                    style: TextStyle(
                      color: AppColors.onSurfaceColor(context),
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Card(
                    color: AppColors.tertiaryColor(context),
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        width: 0.3,
                        color: AppColors.onSurfaceColor(context),
                      ),
                    ),
                    child: SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Form(
                          key: _controller.productsFormKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.onSurfaceColor(context),
                                    ),
                                  ),
                                  labelStyle: TextStyle(color: AppColors.onSurfaceColor(context)),
                                  label: const Text("Nome do produto"),
                                ),
                                controller: _controller.productName,
                                validator: _controller.validator,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.onSurfaceColor(context),
                                    ),
                                  ),
                                  labelStyle: TextStyle(color: AppColors.onSurfaceColor(context)),
                                  label: const Text("Valor"),
                                ),
                                controller: _controller.productPrice,
                                validator: _controller.validator,
                              ),
                              const Spacer(),
                              AppPropertyField(
                                labelText: "Ingredientes",
                                controller: _controller.ingredients,
                                inputType: TextInputType.text,
                                detailColor: AppColors.onSurfaceColor(context),
                                validator: (value) {
                                  return null;
                                },
                              ),
                              const Spacer(),
                              AppButton(
                                onTap: _controller.saveIngredient,
                                primaryColor: AppColors.onSurfaceColor(context),
                                height: height * 0.055,
                                width: width * 0.55,
                                radius: 30,
                                elevation: 10,
                                text: "Salvar Ingrediente",
                                backgroundColor: AppColors.tertiaryColor(context),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  Align(
                    alignment: Alignment.center,
                    child: AppButton(
                      onTap: _controller.createNewProduct,
                      primaryColor: Colors.white,
                      height: height * 0.055,
                      width: width * 0.55,
                      radius: 30,
                      elevation: 10,
                      text: "Finalizar Produto",
                      backgroundColor: AppColors.redPColor(context),
                    ),
                  ),
                  const SizedBox(height: 35),
                  BlocBuilder<IngredientsCubit, List<String>>(
                    bloc: _controller.ingredientsCubit,
                    builder: (context, state) {
                      return IngredientsComponent(
                        ingredients: state,
                        height: height * 0.17,
                        width: width,
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
