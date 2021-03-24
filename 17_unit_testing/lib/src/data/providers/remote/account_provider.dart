import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';

class AccountProvider {
  final AuthenticationClient _authenticationClient;
  AccountProvider(this._authenticationClient);

  Future<User?> get userInformation async {
    final token = _authenticationClient.token;

    if (token == null) {
      throw Exception('token is null');
    }

    await Future.delayed(Duration(seconds: 1));
    return User(
      id: "1234567897",
      email: "test@test.com",
      name: "Test",
      lastname: "Meedu",
      birthday: DateTime(1993, 12, 1),
    );
  }
}
