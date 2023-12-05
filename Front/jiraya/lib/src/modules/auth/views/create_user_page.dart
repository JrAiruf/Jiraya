import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya/src/modules/auth/view_models/blocs/create_user_bloc/create_user_bloc.dart";
import "package:jiraya/src/modules/auth/view_models/controllers/create_user_controller.dart";
import "package:jiraya/src/modules/initial/components/logo_component.dart";
import "package:jiraya/src/shared/app_colors.dart";
import "package:jiraya/src/shared/components/app_elevated_button.dart";
import "package:jiraya/src/shared/components/app_property_field.dart";
import "package:jiraya/src/shared/components/state_views/loading_state_view.dart";

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

final _controller = Modular.get<CreateUserController>();

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: BlocConsumer(
        bloc: _controller.createUserBloc,
        listener: (context, state) {
          if (state is CreateUserFailureState) {
            _controller.statusSnackBar(context, state.message, AppColors.redPColor(context));
          }
          if (state is CreateUserSuccessState) {
            final user = state.user;
            Modular.to.navigate("/user/", arguments: user);
          }
        },
        builder: (context, state) {
          if (state is CreateUserLoadingState) {
            return const LoadingStateView();
          }
          return SingleChildScrollView(
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
                    const SizedBox(height: 50),
                    SizedBox(
                      height: height * 0.3,
                      child: Form(
                        key: _controller.createUserFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppPropertyField(
                                labelText: "Nome Completo",
                                controller: _controller.userName,
                                inputType: TextInputType.text,
                                detailColor: AppColors.onSurfaceColor(context),
                                validator: _controller.validator),
                            AppPropertyField(
                                labelText: "Código de Segurança",
                                controller: _controller.userCode,
                                inputType: TextInputType.number,
                                detailColor: AppColors.onSurfaceColor(context),
                                validator: _controller.validator),
                            AppPropertyField(
                                labelText: "Confirmar Códio",
                                controller: _controller.confirmationCode,
                                inputType: TextInputType.text,
                                detailColor: AppColors.onSurfaceColor(context),
                                validator: _controller.validator),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    AppElavatedButton(
                      onTap: _controller.createNewUser,
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
          );
        },
      ),
    );
  }
}
