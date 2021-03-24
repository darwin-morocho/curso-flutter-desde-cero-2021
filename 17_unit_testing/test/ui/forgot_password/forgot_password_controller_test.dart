import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_controller.dart';

import '../../dependency_injection.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  group('ForgotPasswordController > ', () {
    late ForgotPasswordController controller;
    setUp(() {
      controller = ForgotPasswordController();
    });
    test('email == ""', () {
      expect(controller.email == '', true);
    });

    test('onEmailChanged', () {
      controller.onEmailChanged("test@test.com");
      expect(controller.email, "test@test.com");
    });

    test('submit invalid email', () async {
      bool catchCalled = false;
      try {
        controller.onEmailChanged("");
        await controller.submit();
      } catch (e) {
        if (e is AssertionError) {
          catchCalled = true;
        }
      }
      expect(catchCalled, true);
    });

    test('submit success', () async {
      controller.onEmailChanged("test@test.com");
      final result = await controller.submit();
      expect(result, true);
    });
  });
}
