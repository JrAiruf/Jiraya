import 'package:bloc/bloc.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_repository.dart';
import 'package:jiraya/src/modules/products/models/create_product_model.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvents, CreateProductStates> {
  CreateProductBloc(IProductsRepository repository)
      : _repository = repository,
        super(CreateProductInitialState()) {
    on<CreateProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final IProductsRepository _repository;

  void _mapCreateProductEventToState(CreateProductEvent event, Emitter<CreateProductStates> state) async {
    state(CreateProductLoadingState());
    // final result = 
  }
}
