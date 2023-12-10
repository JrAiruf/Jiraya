import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:jiraya/src/modules/products/view_models/blocs/get_products_bloc/get_products_bloc.dart";
import "package:jiraya/src/modules/products/view_models/controllers/products_controller.dart";
import "package:jiraya/src/modules/products/views/components/product_tile.dart";
import "package:jiraya/src/shared/app_colors.dart";
import "package:jiraya/src/shared/components/state_views/failure_state_view.dart";
import "package:jiraya/src/shared/components/state_views/loading_state_view.dart";

class UserProductsPage extends StatefulWidget {
  const UserProductsPage({super.key});

  @override
  State<UserProductsPage> createState() => _UserProductsPageState();
}

final _controller = Modular.get<ProductsController>();

class _UserProductsPageState extends State<UserProductsPage> {
  @override
  void initState() {
    super.initState();
    _controller.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: BlocBuilder(
        bloc: _controller.getProductBloc,
        builder: (context, state) {
          if (state is GetProductsLoadingState) {
            return const LoadingStateView();
          }
          if (state is GetProductsFailureState) {
            return FailureStateView(message: state.message);
          }
          if (state is GetProductsSuccessState) {
            final products = state.products;
            return SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: _controller.back,
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.onSurfaceColor(context),
                              ),
                            ),
                          ),
                          Text(
                            "Produtos",
                            style: TextStyle(
                              fontSize: 35,
                              color: AppColors.onSurfaceColor(context),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        
                        itemCount: products.length,
                        itemBuilder: (_, i) {
                          final product = products[i];
                          return ProductTile(
                            product: product,
                            height: height,
                            width: width,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
