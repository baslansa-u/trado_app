import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trado_app/core/errors/exceptions.dart';
import 'package:trado_app/features/auth/data/datasources/auth_local_datasource.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDatasourceImpl(this.secureStorage);

  @override
  Future<void> deleteToken() async {
    try {
      await secureStorage.delete(key: 'auth_token');
    } catch (e) {
      throw CacheException('Failed to delete token: ${e.toString()}');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await secureStorage.read(key: 'auth_token');
    } catch (e) {
      throw CacheException('Failed to get token: ${e.toString()}');
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await secureStorage.write(key: 'auth_token', value: token);
    } catch (e) {
      throw CacheException('Failed to save token: ${e.toString()}');
    }
  }
}
