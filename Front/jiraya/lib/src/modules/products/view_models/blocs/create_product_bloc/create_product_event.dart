part of 'create_product_bloc.dart';

@immutable
sealed class CreateProductEvents {}

final class CreateProductEvent extends CreateProductEvents {
  final CreateProductModel newProduct;

  CreateProductEvent(this.newProduct);
}
