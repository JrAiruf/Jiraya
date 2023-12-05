import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/views/user_home_page.dart';

class UserModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => const UserHomePage());
  }
}
