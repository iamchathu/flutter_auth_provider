import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_example/auth/type_def.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<MyAuthManager>().logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(),
    );
  }
}
