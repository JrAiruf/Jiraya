import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/shared/services/http_client.dart';
import 'package:jiraya/src/shared/services/app_cliente.dart';
import 'package:jiraya/src/modules/products/data/datasource/product_datasource.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_datasource.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_repository.dart';
import 'package:jiraya/src/modules/products/data/repositories/product_repository.dart';
import 'package:jiraya/src/modules/products/view_models/blocs/create_product_bloc/create_product_bloc.dart';
import 'package:jiraya/src/modules/products/view_models/controllers/products_controller.dart';
import 'package:jiraya/src/modules/products/view_models/cubits/cubit/ingredients_cubit.dart';
import 'package:jiraya/src/modules/products/views/create_product_page.dart';
import 'package:jiraya/src/modules/products/views/products_list_page.dart';
import 'package:jiraya/src/modules/products/views/user_product_page.dart';

class ProductModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/create_product_page", child: (_) => const CreateProductPage());
    r.child("/user_product_page", child: (_) => const UserProductPage());
    r.child("/products_list_page", child: (_) => const ProductsListPage());
  }

  @override
  void binds(Injector i) {
    super.binds(i);
    i.add<AppClient>(HttpClient.new);
    i.add<IProductsDatasource>(ProductDatasource.new);
    i.add<IProductsRepository>(ProductRepository.new);
    i.add<CreateProductBloc>(CreateProductBloc.new);
    i.add<IngredientsCubit>(IngredientsCubit.new);
    i.add<ProductsController>(ProductsController.new);
  }
}
