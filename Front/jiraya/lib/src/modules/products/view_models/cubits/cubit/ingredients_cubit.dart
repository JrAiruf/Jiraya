import 'package:bloc/bloc.dart';

class IngredientsCubit extends Cubit<List<String>> {
  IngredientsCubit() : super([]);

  void saveIngredient(String newIngredient) {
    final ingredients = <String>[];
    state.insert(state.length, newIngredient);
    ingredients.addAll(state);
    emit(ingredients);
  }
}
