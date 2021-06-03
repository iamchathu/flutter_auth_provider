library flutter_auth_provider;

import 'package:flutter/foundation.dart';
import 'package:flutter_auth_provider/auth_store.dart';
import 'package:flutter_auth_provider/listener.dart';

/// Auth provider.
class AuthProvider<U> extends ChangeNotifier {
  final List<LoginListener<U>> _loginListeners = [];
  final List<LogoutListener> _logoutListeners = [];
  late final AuthStore<U> _store;

  U? _currentUser;

  /// Get the current logged in user [U].
  U? get user => _currentUser;

  /// Get if user is currently logged in or not.
  bool get isLoggedIn => _currentUser != null;

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U].
  AuthProvider(this._store);

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U] with [LoginListener] and/or [LogoutListener].
  factory AuthProvider.withListeners(
      {required AuthStore<U> store,
      LoginListener<U>? onLogin,
      LogoutListener? onLogout}) {
    AuthProvider<U> provider = AuthProvider(store);
    if (onLogin != null) {
      provider.addLoginListener(onLogin);
    }
    if (onLogout != null) {
      provider.addLogoutListener(onLogout);
    }
    return provider;
  }

  /// Call [AuthStore] retrieve to load user from memory.
  Future<void> initialize() async {
    final user = await _store.retrieve();
    _setUser(user);
  }

  /// This function should be called after user[U] credentials got authenticated.
  /// Authenticated [user] must be provided.
  onLogin(U user) async {
    await _store.save(user);
    _loginListeners.forEach((listener) {
      listener.onLogin(user);
    });
    _setUser(user);
  }

  /// This function should be called when you want to logged out current user.
  /// Store will get cleared and [LogoutListener] will get called.
  logout() async {
    await _store.delete();
    _logoutListeners.forEach((listener) {
      listener.onLogout();
    });
    _setUser(null);
  }

  _setUser(U? user) {
    this._currentUser = user;
    this.notifyListeners();
  }

  /// Add [listener] to LoginListeners.
  /// The listeners will get called with logged in user [U].
  /// Setting up Sentry user and other login related activities can be done using the listener.
  void addLoginListener(LoginListener<U> onLogin) {
    _loginListeners.add(onLogin);
  }

  /// Add [listener] to LogoutListeners.
  /// The listeners will get called when user logout is called.
  /// Clearing Sentry user other cache clearing can be done using the listener
  void addLogoutListener(LogoutListener onLogout) {
    _logoutListeners.add(onLogout);
  }
}
