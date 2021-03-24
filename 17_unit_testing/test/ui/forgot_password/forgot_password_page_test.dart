import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/ui/global_widgets/input_text.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_page.dart';

import '../../dependency_injection.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  testWidgets('ForgotPasswordPage', (WidgetTester tester) async {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    await tester.pumpWidget(MaterialApp(
      home: ForgotPasswordPage(),
      navigatorKey: navigatorKey,
    ));
    final router = navigatorKey.currentState!;

    final buttonFinder = find.text("Send");
    await tester.tap(buttonFinder);

    await tester.pump();
    // invalid email dialog
    expect(find.text("Invalid email"), findsOneWidget);
    router.pop();
    await tester.pump();
    // dismiss invalid email dialog
    expect(find.text("Invalid email"), findsNothing);
    await tester.enterText(find.byType(InputText), "test@test.com");
    await tester.pump();
    expect(find.text("test@test.com"), findsOneWidget);
    await tester.tap(buttonFinder);
    await tester.pump(Duration(milliseconds: 1100));
    expect(find.text("GOOD"), findsOneWidget);
  });
}
