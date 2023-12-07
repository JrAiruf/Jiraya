import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class IngredientsCubit extends Cubit<List<String>> {
  IngredientsCubit() : super([]);

  void saveIngredient(String newIngredient) {
    state.clear();
    state.add(newIngredient);
    emit(state);
  }
}
