import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';
import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/authentication_repository_impl.dart';

void main() {
  test(
    'authentication',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final authenticationProvider = AuthenticationProvider();
      final authenticationClient = AuthenticationClient(prefs);

      // final AuthenticationRepository repository = MockAuthenticationRepository();
    },
  );
}

class MockAuthenticationProvider implements AuthenticationProvider {
  @override
  Future<String?> login(String email, String password) async {
    if (email == "test@test.com" && password == "test") {
      final String token = DateTime.now().millisecondsSinceEpoch.toString();
      return token;
    }
    return null;
  }

  @override
  Future<bool> register(User user) async {
    return true;
  }

  @override
  Future<bool> sendResetToken(String email) async {
    return true;
  }
}

class MockAuthenticationClient implements AuthenticationClient {
  Map<String, Object> _data = {};

  @override
  Future<void> saveToken(String token) async {
    _data['token'] = token;
  }

  @override
  Future<void> signOut() async {
    _data.remove('token');
  }

  @override
  String? get token => _data['token'] as String?;
}

class MockAccountProvider implements AccountProvider {
  @override
  Future<User?> get userInformation async {
    return User(
      id: "1234567897",
      email: "test@test.com",
      name: "Test",
      lastname: "Meedu",
      birthday: DateTime(1993, 12, 1),
    );
  }
}
