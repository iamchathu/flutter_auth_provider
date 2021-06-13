## 0.0.1-dev.6

* [Breaking] Remove `addListener` chaining support. If you have used chaining with `cascade` operator.
* Add async support for `TokenStore`'s `save` and `clear` methods.
* Abstract `AuthProvider` to `AuthService` core. 
* Refactor tests.

## 0.0.1-dev.5

* Refactor project structure without breaking changes.
* Add tests.

## 0.0.1-dev.4

* Add TokenStore interface.

## 0.0.1-dev.3

* Remove initialize from constructor make it public so consumer can use when they want.
* Introduce withListeners factory to construct AuthProvider with single LoginListener and LogoutListener.

## 0.0.1-dev.1

* Initial release.
