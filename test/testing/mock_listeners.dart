import 'package:flutter_auth_provider/flutter_auth_provider.dart';
import 'package:mockito/mockito.dart';

class MockLogoutListener extends Mock implements LogoutListener {}

class MockLogInListener<U> extends Mock implements LoginListener<U> {}
