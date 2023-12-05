import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/auth/data/external/auth_datasource.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/app_cliente.dart';
import 'package:jiraya/src/modules/auth/data/external/http_client.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_datasource.dart';
import 'package:jiraya/src/modules/auth/data/interfaces/iauth_repository.dart';
import 'package:jiraya/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:jiraya/src/modules/auth/view_models/blocs/create_customer_bloc/create_customer_bloc.dart';
import 'package:jiraya/src/modules/auth/view_models/controllers/auth_controller.dart';
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
    i.add<AppClient>(HttpClient.new);
    i.add<IAuthDatasource>((AuthDatasource.new));
    i.add<IAuthRepository>(AuthRepository.new);
    i.add<CreateCustomerBloc>(CreateCustomerBloc.new);
    i.add<AuthController>(AuthController.new);
    i.add<CreateCustomerController>(CreateCustomerController.new);
  }
}
