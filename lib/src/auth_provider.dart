import 'package:flutter/widgets.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:provider/provider.dart';

class AuthProvider<U> extends StatelessWidget {
  final AuthStore<U> store;
  final Widget? child;

  const AuthProvider({
    Key? key,
    required this.store,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthManager<U>(store)..initialize(),
      child: child,
    );
  }
}
