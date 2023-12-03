import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya_app/src/modules/auth/view_models/controllers/create_customer_controller.dart";
import "package:jiraya_app/src/modules/initial/components/logo_component.dart";
import "package:jiraya_app/src/shared/app_colors.dart";
import "package:jiraya_app/src/shared/components/app_elevated_button.dart";
import "package:jiraya_app/src/shared/components/app_property_field.dart";

class CreateCustomerPage extends StatefulWidget {
  const CreateCustomerPage({Key? key}) : super(key: key);

  @override
  State<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

final _controller = Modular.get<CreateCustomerController>();

class _CreateCustomerPageState extends State<CreateCustomerPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: _controller.back,
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.onSurfaceColor(context),
                      ),
                    ),
                  ),
                ),
                LogoComponent(
                  delayedTransition: false,
                  text: AppColors.onSurfaceColor(context),
                  title: AppColors.surfaceColor(context),
                ),
                SizedBox(height: height * 0.08),
                SizedBox(
                  height: height * 0.3,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppPropertyField(
                          labelText: "Nome Completo",
                          controller: _controller.customerName,
                          inputType: TextInputType.text,
                          detailColor: AppColors.onSurfaceColor(context),
                        ),
                        AppPropertyField(
                          labelText: "Celular",
                          controller: _controller.phoneNumber,
                          inputType: TextInputType.number,
                          detailColor: AppColors.onSurfaceColor(context),
                        ),
                        AppPropertyField(
                          labelText: "Bairro",
                          controller: _controller.neighborhood,
                          inputType: TextInputType.text,
                          detailColor: AppColors.onSurfaceColor(context),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AppPropertyField(
                                labelText: "Endereço",
                                controller: _controller.streetAddress,
                                inputType: TextInputType.text,
                                detailColor: AppColors.onSurfaceColor(context),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: AppPropertyField(
                                labelText: "N°",
                                controller: _controller.addressNumber,
                                inputType: TextInputType.number,
                                detailColor: AppColors.onSurfaceColor(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                AppElavatedButton(
                  onTap: () {},
                  primaryColor: Colors.white,
                  height: height,
                  width: width,
                  elevation: 10,
                  backgroundColor: AppColors.yellowSColor(context),
                  text: "Cadastrar",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
