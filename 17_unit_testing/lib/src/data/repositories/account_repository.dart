import 'package:ui_ux/src/data/models/user.dart';

abstract class AccountRepository {
  Future<User?> get userInformation;
}
