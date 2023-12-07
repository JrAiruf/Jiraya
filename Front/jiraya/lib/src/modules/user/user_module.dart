import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/user/view_models/controllers/user_controller.dart';
import 'package:jiraya/src/modules/user/views/user_home_page.dart';

class UserModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => const UserHomePage());
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.add<UserController>(UserController.new);
  }
}
