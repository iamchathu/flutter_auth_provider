import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_auth_provider_example/auth/user.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider<User> authProvider = context.read<AuthProvider<User>>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  authProvider.onLogin(
                    const User(
                      userName: "Admin",
                      role: 'ADMIN',
                    ),
                  );
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
