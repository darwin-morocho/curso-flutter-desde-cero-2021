import 'package:ui_ux/src/data/models/user.dart';

class AuthenticationProvider {
  Future<String?> login(String email, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    if (email == "test@test.com" && password == "test") {
      final String token = DateTime.now().millisecondsSinceEpoch.toString();
      return token;
    }
    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
