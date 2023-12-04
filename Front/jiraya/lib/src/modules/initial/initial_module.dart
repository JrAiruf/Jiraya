import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/initial/splash_screen.dart';

class InitialModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashScreen());
  }
}
