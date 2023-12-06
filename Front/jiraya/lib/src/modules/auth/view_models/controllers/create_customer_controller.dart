import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/auth/models/create_customer_model.dart';
import 'package:jiraya/src/modules/auth/view_models/blocs/create_customer_bloc/create_customer_bloc.dart';
import 'package:jiraya/src/modules/customer/models/address_model.dart';

class CreateCustomerController {
  final customerName = TextEditingController();
  final phoneNumber = TextEditingController();
  final neighborhood = TextEditingController();
  final streetAddress = TextEditingController();
  final addressNumber = TextEditingController();

  final createCustomerBloc = Modular.get<CreateCustomerBloc>();
  final createCustomerFormKey = GlobalKey<FormState>();

  void back() => Modular.to.pop();
  void createNewCustomer() {
    createCustomerFormKey.currentState?.validate();
    if (createCustomerFormKey.currentState!.validate()) {
      createCustomerFormKey.currentState?.save();
      CreateCustomerModel newCustomer = CreateCustomerModel(
        name: customerName.text,
        phone: phoneNumber.text,
        address: Address(
          neighborhood: neighborhood.text,
          streetAddress: streetAddress.text,
          addressNumber: int.tryParse(addressNumber.text),
        ),
      );

      createCustomerBloc.add(CreateCustomerEvent(newCustomer));
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
    if (number == null || number.toString().isEmpty) {
      return "Por favor, preencha o campo acima";
    }
    if (number == -2) {
      return "Por favor, especifique um número válido";
    }
    return null;
  }

  statusSnackBar(BuildContext context, String message, Color backgroundColor) {
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
