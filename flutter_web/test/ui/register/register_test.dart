import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/ui/pages/register/register_controller.dart';
import 'package:ui_ux/src/ui/pages/register/register_page.dart';

import '../../dependency_injection.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  group('RegisterController', () {
    late RegisterController controller;
    setUp(() {
      controller = RegisterController();
    });

    test('email, name & lastname', () {
      expect(controller.email, '');
      expect(controller.name, '');
      expect(controller.lastname, '');

      controller.onEmailChanged("darwin@test.com");
      controller.onNameChanged("Darwin");
      controller.onLastnameChanged("Morocho");

      expect(controller.email, 'darwin@test.com');
      expect(controller.name, 'Darwin');
      expect(controller.lastname, 'Morocho');
    });

    test('submit', () async {
      controller.onEmailChanged("darwin@test.com");
      controller.onNameChanged("Darwin");
      controller.onLastnameChanged("Morocho");
      final result = await controller.submit();
      expect(result, true);
    });
  });

  group('GlobalKey<CustomFormState> formKey', () {
    testWidgets('RegisterForm', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              key: Key('homeButton'),
              child: Text(""),
              onPressed: () {
                Navigator.pushNamed(context, Routes.REGISTER);
              },
            ),
          ),
        ),
        routes: {
          '/register': (_) => RegisterPage(),
        },
      ));

      await tester.tap(find.byKey(Key('homeButton')));
      await tester.pumpAndSettle(Duration(milliseconds: 300));

      final buttonFinder = find.byType(RoundedButton);
      expect(buttonFinder, findsOneWidget);
      await tester.tap(buttonFinder);
      await tester.pump();
      expect(find.text("Invalid Inputs"), findsOneWidget);
      expect(find.text("ERROR"), findsOneWidget);
      await tester.tap(find.text("OK"));
      await tester.pump();

      final inputNameFinder = find.byKey(Key('register-name'));
      final inputLastnameFinder = find.byKey(Key('register-lastname'));
      final inputEmailFinder = find.byKey(Key('register-email'));
      await tester.enterText(inputNameFinder, "Darwin");
      await tester.enterText(inputLastnameFinder, "Morocho");
      await tester.enterText(inputEmailFinder, "test@test.com");
      await tester.pump();
      expect(find.text("Darwin"), findsOneWidget);
      expect(find.text("Morocho"), findsOneWidget);
      expect(find.text("test@test.com"), findsOneWidget);
      await tester.tap(buttonFinder);
      await tester.pump(Duration(milliseconds: 1100));
      expect(find.text("GOOD"), findsOneWidget);
      await tester.tap(find.text("Go to login"));
      await tester.pumpAndSettle(Duration(milliseconds: 300));
      expect(find.text("Sign Up"), findsNothing);
    });
  });
}
