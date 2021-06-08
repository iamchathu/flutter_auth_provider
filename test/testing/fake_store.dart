import 'dart:async';

import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAuthStore<U> extends Fake implements AuthStore<U> {
  U? _u;

  @override
  FutureOr<void> delete() {
    _u = null;
  }

  @override
  FutureOr<U?> retrieve() {
    return _u;
  }

  @override
  FutureOr<void> save(U user) {
    _u = user;
  }
}
