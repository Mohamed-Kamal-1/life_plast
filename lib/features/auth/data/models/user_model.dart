import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String email) {
    return UserModel(
      id: json['id'] as String,
      email: email,
      fullName: json['full_name'] as String,
      role: json['role'] as String,
    );
  }
}
