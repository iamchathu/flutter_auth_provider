/// The listener interface to be implemented for subscribers who wants to be notified to when user[U] logged in.
abstract class LoginListener<U> {
  void onLogin(U user);
}

/// The listener interface to be implemented for subscriber who wants to be notified when user logged out.
abstract class LogoutListener {
  void onLogout();
}
