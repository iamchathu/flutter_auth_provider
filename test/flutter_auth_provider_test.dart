import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'testing/fake_store.dart';
import 'testing/mock_listeners.dart';

void main() {
  group(AuthManager, () {
    late AuthStore<String> authStore;
    late AuthManager<String> authManager;

    setUp(() {
      authStore = FakeAuthStore<String>();
      authManager = AuthManager<String>(authStore);
    });

    test('initially isLoggedIn is false', () {
      expect(authManager.isLoggedIn, false);
    });

    test('initially user is null', () {
      expect(authManager.user, isNull);
    });

    test('user should be set after login in', () async {
      await authManager.onLogin('user');

      expect(authManager.user, 'user');
    });

    test('isLoggedIn should be set to true after login in', () async {
      await authManager.onLogin('user');

      expect(authManager.isLoggedIn, true);
    });

    test('user should be set to null after logout', () async {
      await authManager.logout();

      expect(authManager.user, isNull);
    });

    test('isLoggedIn should be set to false after  logout', () async {
      await authManager.logout();

      expect(authManager.isLoggedIn, false);
    });

    test('logoutListener should be called once after logout', () async {
      MockLogoutListener mockLogoutListener = MockLogoutListener();
      authManager.addLogoutListener(mockLogoutListener);

      await authManager.logout();

      verify(mockLogoutListener.onLogout()).called(1);
    });

    test('loginListener should be called once after login', () async {
      MockLogInListener<String> mockLoginListener = MockLogInListener();
      authManager.addLoginListener(mockLoginListener);

      await authManager.onLogin('user');

      verify(mockLoginListener.onLogin('user')).called(1);
    });

    test('all logoutListeners should be called once after logout', () async {
      MockLogoutListener mockLogoutListener1 = MockLogoutListener();
      MockLogoutListener mockLogoutListener2 = MockLogoutListener();
      authManager
        ..addLogoutListener(mockLogoutListener1)
        ..addLogoutListener(mockLogoutListener2);

      await authManager.logout();

      verify(mockLogoutListener1.onLogout()).called(1);
      verify(mockLogoutListener2.onLogout()).called(1);
    });

    test('all loginListeners should be called once after login', () async {
      MockLogInListener<String> mockLoginListener1 = MockLogInListener();
      MockLogInListener<String> mockLoginListener2 = MockLogInListener();
      authManager
        ..addLoginListener(mockLoginListener1)
        ..addLoginListener(mockLoginListener2);

      await authManager.onLogin('user');

      verify(mockLoginListener1.onLogin('user')).called(1);
      verify(mockLoginListener2.onLogin('user')).called(1);
    });
  });
}
