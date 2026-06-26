import 'package:json_annotation/json_annotation.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String username;

  const UserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  User toEntity() => User(
        id: id,
        email: email,
        username: username,
      );

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
