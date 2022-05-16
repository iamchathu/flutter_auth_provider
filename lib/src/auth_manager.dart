import 'package:flutter/foundation.dart';
import 'package:flutter_auth_provider/src/auth_store.dart';
import 'package:flutter_auth_provider/src/core.dart';
import 'package:flutter_auth_provider/src/listener.dart';

/// Auth provider.
class AuthManager<U> extends AuthService<U> with ChangeNotifier {
  final List<LoginListener<U>> _loginListeners = [];
  final List<LogoutListener> _logoutListeners = [];

  /// Initialize AuthProvide with [AuthStore] implementation to store logged in [U].
  AuthManager(AuthStore<U> store) : super(store);

  /// This function should be called after user [U] credentials got authenticated.
  /// Authenticated [user] must be provided.
  @override
  Future<void> onLogin(U user) async {
    super.onLogin(user);
    for (LoginListener listener in _loginListeners) {
      listener.onLogin(user);
    }
  }

  /// This function should be called when you want to logged out current user.
  /// Store will get cleared and [LogoutListener] will get called.
  @override
  Future<void> logout() async {
    super.logout();
    for (LogoutListener listener in _logoutListeners) {
      listener.onLogout();
    }
  }

  @override
  void setUser(U? user) {
    super.setUser(user);
    notifyListeners();
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
