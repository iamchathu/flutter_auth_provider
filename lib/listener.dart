import 'package:auth_provider/user.dart';

abstract class LoginListener {
  onLogin(User user);
}

abstract class LogoutListener {
  onLogout();
}
