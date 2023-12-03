import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya_app/src/shared/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: applicationTheme,
      themeMode: ThemeMode.system,
      darkTheme: applicationDarkTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
