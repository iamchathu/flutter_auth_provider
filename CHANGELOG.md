# Changelog

## [1.0.1](https://github.com/iamchathu/flutter_auth_provider/compare/v1.0.0...v1.0.1) (2024-03-24)

### Reverts

* add pub.dev publishing to same
  job ([462f550](https://github.com/iamchathu/flutter_auth_provider/commit/462f5500a6dbcbbaa47e30fe0c5a353444d603c7))
* add separate workflow to
  publish ([b4a626f](https://github.com/iamchathu/flutter_auth_provider/commit/b4a626f29326e35b90c1a9c41ee07918515e500f))
* remove publishing flow as it can conflict with release
  please ([d85542b](https://github.com/iamchathu/flutter_auth_provider/commit/d85542b2aa0a473110a1f7f856138f7af211ddfe))

## [1.0.0](https://github.com/iamchathu/flutter_auth_provider/compare/v0.0.4...v1.0.0) (2024-03-24)

### ⚠ BREAKING CHANGES

* Rename AuthProvider to AuthManager

### Features

* add example project ([475b6ad](https://github.com/iamchathu/flutter_auth_provider/commit/475b6adef6e5c293e8734cc134eef82a35a30940))
* add support to diagnostics and refactor tests. ([61ef4a5](https://github.com/iamchathu/flutter_auth_provider/commit/61ef4a52464e588351197fea5683bc711f6cbb7e))
* introduce AuthProvider widget ([bc02bcb](https://github.com/iamchathu/flutter_auth_provider/commit/bc02bcbf261da68401493d0a25f7655600c12863))
* update AuthProvider to be used with MultiProvider ([9fc37be](https://github.com/iamchathu/flutter_auth_provider/commit/9fc37bed2fae471caab3adc9771256e825101f2b))

### Bug Fixes

* make child of auth provider
  optional ([717aaba](https://github.com/iamchathu/flutter_auth_provider/commit/717aaba75d272d9290c45b954f8f6a6d5dd6a89a))

### Reverts

* remove publishing flow as it can conflict with release
  please ([639a715](https://github.com/iamchathu/flutter_auth_provider/commit/639a7152bc43023e292edc32bbac72db01c36e6b))

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
