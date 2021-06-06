import 'dart:async';

import 'package:flutter_auth_provider/auth_store.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAuthStore<U> implements AuthStore<U> {
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

void main() {
  group(AuthProvider, () {
    late AuthStore<String> authStore;
    late AuthProvider<String> authProvider;

    setUp(() {
      authStore = FakeAuthStore<String>();
      authProvider = AuthProvider<String>(authStore);
    });

    test('initially isLoggedIn is false', () {
      expect(authProvider.isLoggedIn, false);
    });

    test('initially user is null', () {
      expect(authProvider.user, isNull);
    });

    test('user should be set after login in', () async {
      await authProvider.onLogin('user');
      expect(authProvider.user, 'user');
    });

    test('isLoggedIn should be set to true after login in', () async {
      await authProvider.onLogin('user');
      expect(authProvider.isLoggedIn, true);
    });
  });
}
