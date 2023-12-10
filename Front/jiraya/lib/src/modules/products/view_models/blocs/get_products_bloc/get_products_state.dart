part of 'get_products_bloc.dart';

@immutable
sealed class GetProductsStates {}

final class GetProductsInitialState extends GetProductsStates {}

final class GetProductsLoadingState extends GetProductsStates {}

final class GetProductsFailureState extends GetProductsStates {
  final String message;

  GetProductsFailureState(this.message);
}

final class GetProductsSuccessState extends GetProductsStates {
  final List<ProductModel> products;

  GetProductsSuccessState(this.products);
}
