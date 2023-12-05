import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/auth/view_models/controllers/auth_controller.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/modules/initial/components/logo_component.dart';

class AuthRedirectionPage extends StatefulWidget {
  const AuthRedirectionPage({super.key});

  @override
  State<AuthRedirectionPage> createState() => _AuthRedirectionPageState();
}

final _authController = Modular.get<AuthController>();

class _AuthRedirectionPageState extends State<AuthRedirectionPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColors.redPColor(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onLongPress: ()=> _authController.defineRoute("./create_user_page"),
                child: const LogoComponent(
                  delayedTransition: false,
                  text: Colors.white,
                  title: Colors.white,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: () => _authController.defineRoute("./create_customer_page"),
                child: const Text(
                  "Começar",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
