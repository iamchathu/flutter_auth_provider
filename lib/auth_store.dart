import 'package:auth_provider/user.dart';

abstract class AuthStore {
  Future<User> retrieve();
  Future<void> save(User user);
  Future<void> saveTokens({required String token, String? refreshToken});
  Future<void> delete();
}
