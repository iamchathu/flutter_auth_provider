library auth_provider;

import 'package:auth_provider/auth_store.dart';
import 'package:auth_provider/listener.dart';
import 'package:auth_provider/user.dart';
import 'package:flutter/foundation.dart';

/// Auth provider.
class AuthProvider extends ChangeNotifier {
  final List<LoginListener> loginListeners = [];
  final List<LogoutListener> logoutListeners = [];
  late final AuthStore _store;

  User? _currentUser;

  User? get user => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  AuthProvider(this._store) {
    initialize();
  }

  initialize() async {
    final user = await _store.retrieve();
    _setUser(user);
  }

  onLogin(User user) async {
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

  _setUser(User? user) {
    this._currentUser = user;
    this.notifyListeners();
  }

  /// Add [listener] to LoginListeners.
  void addLoginListener(LoginListener listener) {
    loginListeners.add(listener);
  }

  /// Add [listener] to LogoutListeners.
  void addLogoutListener(LogoutListener listener) {
    logoutListeners.add(listener);
  }
}
