import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_example/screens/app.dart';
import 'package:flutter_auth_provider_example/screens/login.dart';

class UnAuthenticatedApp extends StatelessWidget {
  const UnAuthenticatedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp(
      home: Login(),
    );
  }
}
