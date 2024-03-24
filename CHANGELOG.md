## 0.1.3

* Add support to `DiagnosticableTreeMixin`.
* Refactor tests.

## 0.1.2

* Update `AuthProvider` to be used with `MultiProvider`.

## 0.1.1

* Make child property optional in `AuthProvider`.

## 0.1.0

* ** Breaking: ** Rename `AuthProvider` to `AuthManager`.
* Introduce `AuthProvider` wrapping widget.
* Add provider as a dependency.

## 0.0.5

* Update dev dependencies.
* Add simple example project.

## 0.0.4

* Upgrade dev dependencies.
* Update readme.

## 0.0.3

* Promote `0.0.2-dev.1` to stable version.

## 0.0.2-dev.1

* Update import of `ChangeNotifer` to get from flutter/foundation.
* Setup the linter.

## 0.0.2

* Promoted to a stable release.

## 0.0.1-dev.6

* [Breaking] Remove `addListener` chaining support. If you have used chaining with `cascade`
  operator.
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
* Introduce withListeners factory to construct AuthProvider with single LoginListener and
  LogoutListener.

## 0.0.1-dev.1

* Initial release.
