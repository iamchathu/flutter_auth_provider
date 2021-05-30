abstract class AuthStore<U> {
  Future<U> retrieve();
  Future<void> save(U user);
  Future<void> saveTokens({required String token, String? refreshToken});
  Future<void> delete();
}
