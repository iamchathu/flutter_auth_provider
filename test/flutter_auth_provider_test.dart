import 'package:flutter_auth_provider/auth_store.dart';
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class FakeAuthStore<U> extends Fake implements AuthStore<U> {}

void main() {
  group(AuthProvider, () {
    late AuthStore<String> authStore;
    late AuthProvider<String> authProvider;

    setUp(() {
      authStore = FakeAuthStore<String>();
      authProvider = AuthProvider<String>(authStore);
    });

    test('intially isLoggedIn is false', () {
      expect(authProvider.isLoggedIn, false);
    });

    test('intially user is null', () {
      expect(authProvider.user, isNull);
    });
  });
}
