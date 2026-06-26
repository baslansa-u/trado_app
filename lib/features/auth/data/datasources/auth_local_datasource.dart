abstract interface class AuthLocalDatasource {
  Future<String?> getToken();

  Future<void> saveToken(String token);

  Future<void> deleteToken();
}
