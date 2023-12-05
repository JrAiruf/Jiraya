import 'package:jiraya/src/enums/user_role.dart';

class UserModel {
  String? id;
  String? name;
  String? code;
  UserRole role = UserRole.user;
  UserModel({
    this.id,
    this.name,
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
    );
  }
}
