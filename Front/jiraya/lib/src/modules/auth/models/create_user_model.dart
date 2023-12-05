class CreateUserModel {
  String? name;
  String? code;
  CreateUserModel({
    this.name,
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
    };
  }
}
