import 'package:flutter_modular/flutter_modular.dart';

class AuthController {
  void back() => Modular.to.pop();
  void defineRoute(String route) => Modular.to.pushNamed(route);
}
