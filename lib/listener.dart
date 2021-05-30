abstract class LoginListener<U> {
  onLogin(U user);
}

abstract class LogoutListener {
  onLogout();
}
