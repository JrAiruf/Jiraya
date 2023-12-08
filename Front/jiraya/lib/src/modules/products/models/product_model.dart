// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String? id;
  String? name;
  double? price;
  List<String>? ingredients;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'ingredients': ingredients,
    };
  }

  factory ProductModel.fromMap(Map map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      ingredients: map['ingredients'],
    );
  }
}
