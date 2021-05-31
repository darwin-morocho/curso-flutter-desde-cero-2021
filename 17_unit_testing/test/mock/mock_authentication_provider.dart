import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/providers/remote/authentication_provider.dart';

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
