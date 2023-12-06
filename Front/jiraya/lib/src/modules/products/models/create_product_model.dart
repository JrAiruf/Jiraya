// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateProductModel {
  final String? name;
  final double? price;
  final List<String>? ingredients;

  CreateProductModel({
    required this.name,
    required this.price,
    required this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'ingredients': ingredients,
    };
  }

  factory CreateProductModel.fromMap(Map<String, dynamic> map) {
    return CreateProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      ingredients: map['ingredients'],
    );
  }
}
