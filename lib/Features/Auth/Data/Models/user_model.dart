import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/Features/Auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
  });
  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: user.uid,
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? 'guest',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }

  toMap() {
    return {'name': name, 'email': email, 'password': password};
  }
}
