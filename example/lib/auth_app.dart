import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_example/screens/app.dart';
import 'package:flutter_auth_provider_example/screens/dashboard.dart';

class AuthenticatedApp extends StatelessWidget {
  const AuthenticatedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp(
      home: Dashboard(),
    );
  }
}
