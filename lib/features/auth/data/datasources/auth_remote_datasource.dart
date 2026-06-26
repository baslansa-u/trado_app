import 'package:dio/dio.dart';
import 'package:trado_app/core/errors/exceptions.dart';
import 'package:trado_app/features/auth/data/models/user_model.dart';

class AuthRemoteDatasource {
  final Dio dio;
  static const String baseUrl = 'https://api.example.com';

  AuthRemoteDatasource(this.dio);

  // signIn
  Future<UserModel> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/signin',
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown error');
    }
  }

  // signUp
  Future<void> signUp(String email, String password, String username) async {
    try {
      await dio.post(
        '$baseUrl/auth/signup',
        data: {'email': email, 'password': password, 'username': username},
      );
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown error');
    }
  }

  // signOut
  Future<void> signOut() async {
    try {
      await dio.post('$baseUrl/auth/signout');
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown error');
    }
  }

  // getCurrentUser
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await dio.get('$baseUrl/auth/current_user');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Unknown error');
    }
  }
}
