import 'package:ui_ux/src/data/models/user.dart';

abstract class AuthenticationRepository {
  Future<User?> login(String email, String password);
  Future<bool> register(User user);
  Future<bool> sendResetToken(String email);
}
