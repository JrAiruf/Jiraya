import 'package:flutter_modular/flutter_modular.dart';

class UserController {
  void defineRoute(String route) => Modular.to.pushNamed(route);
}