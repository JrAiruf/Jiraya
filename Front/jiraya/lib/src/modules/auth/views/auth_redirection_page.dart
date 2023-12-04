import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/modules/initial/components/logo_component.dart';

class AuthRedirectionPage extends StatefulWidget {
  const AuthRedirectionPage({super.key});

  @override
  State<AuthRedirectionPage> createState() => _AuthRedirectionPageState();
}


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
              const LogoComponent(
                delayedTransition: false,
                text: Colors.white,
                title: Colors.white,
              ),
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: (){},
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
