import 'package:flutter/foundation.dart';
import 'package:flutter_auth_provider/src/auth_store.dart';

abstract class AuthService<U> with DiagnosticableTreeMixin {
  final AuthStore<U> _store;

  U? _currentUser;

  /// Get the current logged in user [U].
  U? get user => _currentUser;

  /// Get if user is currently logged in or not.
  bool get isLoggedIn => _currentUser != null;

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U].
  AuthService(this._store);

  /// Call [AuthStore] retrieve to load user from memory.
  Future<void> initialize() async {
    final user = await _store.retrieve();
    setUser(user);
  }

  /// This function should be called after user[U] credentials got authenticated.
  /// Authenticated [user] must be provided.
  onLogin(U user) async {
    await _store.save(user);
    setUser(user);
  }

  /// This function should be called when you want to logged out current user.
  /// Store will get cleared and [LogoutListener] will get called.
  logout() async {
    await _store.delete();
    setUser(null);
  }

  @protected
  setUser(U? user) {
    _currentUser = user;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // list all the properties of your class here.
    // See the documentation of debugFillProperties for more information.
    properties.add(
      FlagProperty(
        'isLoggedIn',
        value: isLoggedIn,
      ),
    );
  }
}
