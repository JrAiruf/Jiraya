import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/customer/views/customer_home_page.dart';

class CustomerModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/", child: (_) => const CustomerHomePage());
  }

  @override
  void binds(Injector i) {
    super.binds(i);
  }
}
