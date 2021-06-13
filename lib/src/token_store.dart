import 'dart:async';

/// Token store interface. Implement this your own storage mechanism to store token and refreshToken.
abstract class TokenStore {
  /// Retrieve token is exists.
  FutureOr<String?> getToken();

  /// Retrieved return refreshToken exists.
  FutureOr<String?> getRefreshToken();

  /// Store [token] and [refreshToken]. [token] is mandatory.
  FutureOr<void> saveTokens({required String token, String? refreshToken});

  /// Clear token and refreshToken.
  FutureOr<void> clear();
}
