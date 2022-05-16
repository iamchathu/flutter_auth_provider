import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_example/theme.dart';

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: home,
    );
  }
}
