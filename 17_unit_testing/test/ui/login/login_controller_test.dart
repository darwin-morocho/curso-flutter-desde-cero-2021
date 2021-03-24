import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/pages/login/login_controller.dart';

import '../../dependency_injection.dart';

void main() {
  late LoginController loginController;
  setUpAll(() async {
    await TestDependencyInjection.initialize();
    loginController = LoginController();
  });
  tearDownAll(() {
    TestDependencyInjection.clear();
  });
  group('LoginController > ', () {
    test('onEmailChanged', () {
      expect(loginController.email, '');
      loginController.onEmailChanged("test@test.com");
      expect(loginController.email, 'test@test.com');
    });

    test('onPasswordChanged', () {
      expect(loginController.password, '');
      loginController.onPasswordChanged("test");
      expect(loginController.password, 'test');
    });

    test('submit failed', () async {
      loginController.onEmailChanged("test@test.com");
      loginController.onPasswordChanged("asasasas");
      final user = await loginController.submit();
      expect(user == null, true);
    });

    test('submit success', () async {
      loginController.onEmailChanged("test@test.com");
      loginController.onPasswordChanged("test");
      final user = await loginController.submit();
      expect(user, isA<User>());
      final token = Get.i.find<AuthenticationRepository>().token;
      expect(token != null, true);
    });
  });
}
