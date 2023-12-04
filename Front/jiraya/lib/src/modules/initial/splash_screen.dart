import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/shared/app_colors.dart';
import 'package:jiraya/src/modules/initial/components/logo_component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToAuth();
    super.initState();
  }

  _goToAuth() async {
    await Future.delayed(const Duration(seconds: 7));
    Modular.to.pushNamed("/auth/");
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColors.redPColor(context),
        child: const LogoComponent(
          delayedTransition: true,
          text: Colors.white,
          title: Colors.white,
        ),
      ),
    );
  }
}
