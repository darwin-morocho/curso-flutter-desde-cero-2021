import 'package:ui_ux/src/data/models/user.dart';

class AuthenticationProvider {
  Future<User?> login(String email, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    if (email == "test@test.com" && password == "test") {
      return User(
        id: "1234567897",
        email: "test@test.com",
        name: "Test",
        lastname: "Meedu",
        birthday: DateTime(1993, 12, 1),
      );
    }
    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
