import 'package:flutter/widgets.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

mixin AuthProviderSingleChildWidget on SingleChildWidget {}

class AuthProvider<U> extends SingleChildStatelessWidget
    with AuthProviderSingleChildWidget {
  final AuthStore<U> store;
  final Widget? child;

  const AuthProvider({
    Key? key,
    required this.store,
    this.child,
  }) : super(key: key);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '$runtimeType used outside of MultiProvider must specify a child',
    );
    return ChangeNotifierProvider(
      create: (_) => AuthManager<U>(store)..initialize(),
      child: child,
    );
  }
}
