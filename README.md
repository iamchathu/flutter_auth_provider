# flutter_auth_provider

Simple but extensible authentication manager for Flutter.

## Getting started

* Add the dependency.
* Implement the Stores.
* Wire the store.

### Concepts

#### 1. Stores

Stores are abstract classes which give you power to implement your own way of persisting
authentication related data.

There are two Stores you will have to implement.

* AuthStore - This is generalized your user related data store. When you create implementation you
  can give the type or User object you going to store.
* TokenStore - This store is to implement the way you store token and refresh token.

Example implementation with `flutter-secure-storage`.

```dart
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

#### 2. Listeners

There are two listener type. These can be used to act on the Auth events. Ex: Setting up Sentry with
user details and remove, setup/release resources when logout.

* LoginListener - Call when user is login in.
* LogoutListener - Called when user logs out.