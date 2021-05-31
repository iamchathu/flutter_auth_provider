import 'dart:async';

/// Auth data store interface. Should implement this with storing user details.
/// Better to store in a secure storage.
abstract class AuthStore<U> {
  /// When initializing the AuthProvider this method will be called to retrieve the saved User data.
  /// Should return [U]
  FutureOr<U?> retrieve();

  /// When ever user[U] logged in this method will be called to persist the user information.
  FutureOr<void> save(U user);

  /// When ever user logged out this method will be called to remove the persisted user.
  FutureOr<void> delete();
}
