import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiraya/src/modules/products/views/create_product_page.dart';
import 'package:jiraya/src/modules/products/views/products_list_page.dart';

class ProductModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child("/create_product_page", child: (_) => const CreateProductPage());
    r.child("/products_list_page", child: (_) => const ProductsListPage());

  }
}
