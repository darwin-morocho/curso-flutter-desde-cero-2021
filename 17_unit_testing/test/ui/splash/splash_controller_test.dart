import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/data/repositories/authentication_repository.dart';
import 'package:ui_ux/src/data/repositories/preferences_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/pages/splash/splash_controller.dart';

import '../../dependency_injection.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  group('afterFirstLayout', () {
    test('token == null && isReady false', () async {
      addTearDown(() async {
        await Get.i.find<PreferencesRepository>().setOnboardAndWelcomeReady(true);
      });
      final controller = SplashController();
      final Completer<void> completer = Completer();
      controller.onAfterFirstLayout = (User? user, bool isReady) {
        expect(user == null, true);
        expect(isReady, false);
        completer.complete();
      };
      controller.afterFirstLayout();
      await completer.future;
    });

    test('token == null && isReady true', () async {
      addTearDown(() async {
        await Get.i.find<AuthenticationRepository>().saveToken("kaskasaskasksa");
      });
      final controller = SplashController();
      final Completer<void> completer = Completer();
      controller.onAfterFirstLayout = (User? user, bool isReady) {
        expect(user == null, true);
        expect(isReady, true);
        completer.complete();
      };
      controller.afterFirstLayout();
      await completer.future;
    });

    test('token != null', () async {
      final controller = SplashController();
      final Completer<void> completer = Completer();
      controller.onAfterFirstLayout = (User? user, bool isReady) {
        expect(user == null, false);
        completer.complete();
      };
      controller.afterFirstLayout();
      await completer.future;
    });
  });
}
