import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya/src/modules/auth/models/create_user_model.dart";
import "package:jiraya/src/modules/auth/view_models/blocs/create_user_bloc/create_user_bloc.dart";

class CreateUserController {
  final userName = TextEditingController();
  final userCode = TextEditingController();
  final confirmationCode = TextEditingController();
  final createUserBloc = Modular.get<CreateUserBloc>();
  final createUserFormKey = GlobalKey<FormState>();

  void back() => Modular.to.pop();
  void createNewUser() {
    createUserFormKey.currentState?.validate();
    if (createUserFormKey.currentState!.validate()) {
      createUserFormKey.currentState?.save();
      CreateUserModel newUser = CreateUserModel(
        name: userName.text,
        code: userCode.text,
      );
      createUserBloc.add(CreateUserEvent(newUser));
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
      duration: const Duration(seconds: 4),
      content: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: 70,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
