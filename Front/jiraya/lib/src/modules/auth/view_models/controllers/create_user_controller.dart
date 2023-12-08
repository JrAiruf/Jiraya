import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya/src/modules/auth/models/create_user_model.dart";
import "package:jiraya/src/modules/auth/view_models/blocs/create_user_bloc/create_user_bloc.dart";
import "package:jiraya/src/shared/app_colors.dart";

class CreateUserController {
  final userName = TextEditingController();
  final userCode = TextEditingController();
  final confirmationCode = TextEditingController();
  final createUserBloc = Modular.get<CreateUserBloc>();
  final createUserFormKey = GlobalKey<FormState>();

  void back() => Modular.to.pop();

  void createNewUser(BuildContext context) {
    createUserFormKey.currentState?.validate();
    if (createUserFormKey.currentState!.validate()) {
      createUserFormKey.currentState?.save();
      CreateUserModel newUser = CreateUserModel(
        name: userName.text,
        code: userCode.text,
      );
      userCode.text == confirmationCode.text
          ? createUserBloc.add(CreateUserEvent(newUser))
          : statusSnackBar(
              context,
              "Os códigos de usuário são divergentes. Informe o mesmo código de usuário.",
              AppColors.redPColor(context),
            );
    }
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Por favor, preencha o campo acima";
    }
    return null;
  }

  String? numberValidator(String? value) {
    final number = int.tryParse(value ?? "-2");
    if (value == null || value.isEmpty) {
      return "Por favor, preencha o campo acima";
    }
    if (number == -2) {
      return "Por favor, especifique um número válido";
    }
    return null;
  }

  statusSnackBar(BuildContext context, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
    ));
  }
}
