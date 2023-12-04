import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/auth/view_models/controllers/create_customer_controller.dart';
import 'package:jiraya/src/modules/auth/views/auth_redirection_page.dart';
import 'package:jiraya/src/modules/auth/views/create_customer_page.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => const AuthRedirectionPage());
    r.child("/create_customer_page", child: (_) => const CreateCustomerPage());
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    // i.add<AuthController>(() => AuthController());
    i.add<CreateCustomerController>(() => CreateCustomerController());
  }
}
