import 'dart:async';

import 'package:flutter_auth_provider/auth_store.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_auth_provider/listener.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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

class MockLogoutListener extends Mock implements LogoutListener {}

class MockLogInListener<U> extends Mock implements LoginListener<U> {}

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

    test('user should be set to null after logout', () async {
      await authProvider.logout();
      expect(authProvider.user, isNull);
    });

    test('isLoggedIn should be set to false after  logout', () async {
      await authProvider.logout();
      expect(authProvider.isLoggedIn, false);
    });

    test('logoutListener should be called once after logout', () async {
      MockLogoutListener mockLogoutListener = MockLogoutListener();
      authProvider.addLogoutListener(mockLogoutListener);
      await authProvider.logout();
      verify(mockLogoutListener.onLogout()).called(1);
    });

    test('loginListener should be called once after login', () async {
      MockLogInListener<String> mockLoginListener = MockLogInListener();
      authProvider.addLoginListener(mockLoginListener);
      await authProvider.onLogin('user');
      verify(mockLoginListener.onLogin('user')).called(1);
    });
  });
}
