import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_provider/src/auth_store.dart';
import 'package:flutter_auth_provider/src/core.dart';
import 'package:flutter_auth_provider/src/listener.dart';

/// Auth provider.
class AuthProvider<U> extends AuthService<U> with ChangeNotifier {
  final List<LoginListener<U>> _loginListeners = [];
  final List<LogoutListener> _logoutListeners = [];

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U].
  AuthProvider(AuthStore<U> _store) : super(_store);

  /// This function should be called after user [U] credentials got authenticated.
  /// Authenticated [user] must be provided.
  @override
  Future<void> onLogin(U user) async {
    super.onLogin(user);
    _loginListeners.forEach((listener) {
      listener.onLogin(user);
    });
  }

  /// This function should be called when you want to logged out current user.
  /// Store will get cleared and [LogoutListener] will get called.
  @override
  Future<void> logout() async {
    super.logout();
    _logoutListeners.forEach((listener) {
      listener.onLogout();
    });
  }

  @override
  void setUser(U? user) {
    super.setUser(user);
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
