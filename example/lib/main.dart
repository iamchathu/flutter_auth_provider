import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_auth_provider_example/auth/secure_store.dart';
import 'package:flutter_auth_provider_example/auth/type_def.dart';
import 'package:flutter_auth_provider_example/auth/user.dart';
import 'package:flutter_auth_provider_example/auth_app.dart';
import 'package:flutter_auth_provider_example/unauth_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    AuthProvider<User>(
      store: SecureStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isAuthenticated = context.watch<MyAuthManager>().isLoggedIn;
    if (isAuthenticated) {
      return const AuthenticatedApp();
    } else {
      return const UnAuthenticatedApp();
    }
  }
}
