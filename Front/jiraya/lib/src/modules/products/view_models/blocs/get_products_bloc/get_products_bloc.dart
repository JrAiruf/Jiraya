import 'package:bloc/bloc.dart';
import 'package:jiraya/src/modules/products/data/interfaces/iproducts_repository.dart';
import 'package:jiraya/src/modules/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvents, GetProductsStates> {
  GetProductsBloc(IProductsRepository repository)
      : _repository = repository,
        super(GetProductsInitialState()) {
    on<GetProductsEvent>(_mapGetProductsEventToState);
  }

  final IProductsRepository _repository;

  void _mapGetProductsEventToState(GetProductsEvent event, Emitter<GetProductsStates> state) async {
    state(GetProductsLoadingState());
    final result = await _repository.getAllProducts();
    result.fold(
      (left) => state(
        GetProductsFailureState(left.message),
      ),
      (right) => state(
        GetProductsSuccessState(right),
      ),
    );
  }
}
