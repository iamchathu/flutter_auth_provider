# flutter_auth_provider

Simple and extensible authentication manager for apps built with Flutter.

## Getting started

### Steps

* Add as a dependency.
* Implement the Stores.
* Connect the store to your views.

## Concepts

### 1. Stores

Stores are abstract classes that allow you to implement your custom persistence layer for
authentication related data.

You can implement your own authentication persistence logic by implementing the `Stores`.

* AuthStore - This is your user related data store. When you implement the AuthStore, you can also
  use a custom type for a User specified as a generic.
* TokenStore - Implement how you store and refresh the token.

Example implementation with `flutter-secure-storage`.

```dart
import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
  string userName;
  string role;

  const User({ required this.role, required this.userName});
}

const String userNameKey = 'userName';
const String roleKey = 'name';
const String tokenKey = 'token';
const String refreshTokenKey = 'refreshToken';


class SecureStore implements AuthStore<User>, TokenStore {
  static SecureStore _instance = const SecureStore._();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  const SecureStore._();

  factory SecureStore() => _instance;

  @override
  Future<void> delete() async {
    await _storage.delete(key: userNameKey);
    await _storage.delete(key: roleKey);
  }

  @override
  Future<User?> retrieve() async {
    final userName = await _storage.read(key: userNameKey);
    final role = await _storage.read(key: roleKey);
    if (userName != null && role != null) {
      return User(userName: userName, role: role);
    }
    return null;
  }

  @override
  Future<void> save(User user) async {
    await _storage.write(key: userNameKey, value: user.userName);
    await _storage.write(key: roleKey, value: user.role);
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: tokenKey);
    await _storage.delete(key: refreshTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: refreshTokenKey);
  }

  @override
  Future<String?> getToken() async {
    return _storage.read(key: tokenKey);
  }

  @override
  Future<void> saveTokens({required String token, String? refreshToken}) async {
    await _storage.write(key: tokenKey, value: token);
    if (refreshToken != null) {
      await _storage.write(key: refreshTokenKey, value: refreshToken);
    }
  }
}

```

### 2. Listeners

There are two listeners available. These will execute your code upon Authentication events. 

* LoginListener - Called when user is logged in.
* LogoutListener - Called when user logs out.

Examples:

* Setting up Sentry with user details.
* Remove/setup/release resources upon logging out.

## Contributors

* [Chathu Vishwajith](https://github.com/iamchathu)
* [Pasindu De Silva](https://github.com/pasindud)
* [Bhagya Nirmaan Silva](https://github.com/bhagyas)
