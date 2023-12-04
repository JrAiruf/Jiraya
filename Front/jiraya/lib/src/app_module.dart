import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/auth/auth_module.dart';
import 'package:jiraya/src/modules/initial/initial_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/", module: InitialModule());
    r.module("/auth", module: AuthModule());
  }
}
