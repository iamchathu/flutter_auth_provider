library auth_provider;

import 'package:auth_provider/auth_store.dart';
import 'package:auth_provider/listener.dart';
import 'package:flutter/foundation.dart';

/// Auth provider.
class AuthProvider<U> extends ChangeNotifier {
  final List<LoginListener<U>> loginListeners = [];
  final List<LogoutListener> logoutListeners = [];
  late final AuthStore<U> _store;

  U? _currentUser;

  U? get user => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U].
  AuthProvider(this._store) {
    _initialize();
  }

  _initialize() async {
    final user = await _store.retrieve();
    _setUser(user);
  }

  onLogin(U user) async {
    await _store.save(user);
    _setUser(user);
    loginListeners.forEach((listener) {
      listener.onLogin(user);
    });
  }

  onLogout() async {
    await _store.delete();
    _setUser(null);
    logoutListeners.forEach((listener) {
      listener.onLogout();
    });
  }

  _setUser(U? user) {
    this._currentUser = user;
    this.notifyListeners();
  }

  /// Add [listener] to LoginListeners.
  /// The listeners will get called with logged in user [U].
  /// Setting up Sentry user and other login related activities can be done using the listener.
  void addLoginListener(LoginListener<U> listener) {
    loginListeners.add(listener);
  }

  /// Add [listener] to LogoutListeners.
  /// The listeners will get called when user logout is called.
  /// Clearing Sentry user other cache clearing can be done using the listener
  void addLogoutListener(LogoutListener listener) {
    logoutListeners.add(listener);
  }
}
