import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/view_models/controllers/products_controller.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/shared/components/app_property_field.dart';
import 'package:jiraya/src/shared/components/buttons/app_button.dart';

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
      body: SingleChildScrollView(
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
                  color: AppColors.redPColor(context),
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
                    width: 0.5,
                    color: AppColors.redPColor(context),
                  ),
                ),
                child: SizedBox(
                  height: height * 0.47,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: _controller.productsFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Nome do produto"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Valor"),
                            ),
                          ),
                          SizedBox(height: height * 0.12),
                          AppPropertyField(
                              labelText: "Ingredientes",
                              controller: _controller.productName,
                              inputType: TextInputType.text,
                              detailColor: AppColors.onSurfaceColor(context),
                              validator: _controller.validator),
                          const SizedBox(height: 35),
                          AppButton(
                            onTap: () {},
                            primaryColor: AppColors.redPColor(context),
                            height: height * 0.055,
                            width: width * 0.55,
                            radius: 30,
                            elevation: 10,
                            text: "Salvar Ingrediente",
                            backgroundColor: AppColors.tertiaryColor(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.center,
                child: AppButton(
                  onTap: () {},
                  primaryColor: Colors.white,
                  height: height * 0.055,
                  width: width * 0.55,
                  radius: 30,
                  elevation: 10,
                  text: "Finalizar Produto",
                  backgroundColor: AppColors.redPColor(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
