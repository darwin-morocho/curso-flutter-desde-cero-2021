import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/providers/local/authentication_client.dart';
import 'package:ui_ux/src/data/providers/remote/account_provider.dart';

class MockAccountProvider implements AccountProvider {
  final AuthenticationClient authenticationClient;

  MockAccountProvider(this.authenticationClient);
  @override
  Future<User?> get userInformation async {
    final token = this.authenticationClient.token;

    assert(token != null, 'token is null');

    return User(
      id: "1234567897",
      email: "test@test.com",
      name: "Test",
      lastname: "Meedu",
      birthday: DateTime(1993, 12, 1),
    );
  }
}
