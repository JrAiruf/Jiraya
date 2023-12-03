import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:jiraya_app/shared/app_colors.dart';
=======
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya_app/src/shared/app_colors.dart';
import 'package:jiraya_app/src/modules/initial/components/logo_component.dart';
>>>>>>> Stashed changes

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
<<<<<<< Updated upstream
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height,
      width: width,
      color: AppColors.primaryColor(context),
=======
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
>>>>>>> Stashed changes
    );
  }
}
