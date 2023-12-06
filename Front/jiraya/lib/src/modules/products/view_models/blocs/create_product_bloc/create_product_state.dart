part of 'create_product_bloc.dart';

@immutable
sealed class CreateProductStates {}

final class CreateProductInitialState extends CreateProductStates {}

final class CreateProductLoadingState extends CreateProductStates {}

final class CreateProductFailureState extends CreateProductStates {
  final String message;

  CreateProductFailureState(this.message);
}

final class CreateProductSuccessState extends CreateProductStates {
  final ProductModel product;

  CreateProductSuccessState(this.product);
}
