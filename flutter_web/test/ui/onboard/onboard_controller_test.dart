import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/pages/onboard/onboard_controller.dart';
import 'package:ui_ux/src/ui/pages/onboard/onboard_page.dart';

void main() {
  group('Onboard Controller > ', () {
    final controller = OnboardController();
    test('.svg', () {
      for (final item in controller.items) {
        expect(item.image.contains(".svg"), true);
      }
    });

    test('currentPage initial Value', () {
      expect(controller.currentPage, 0);
    });
  });

  group('Onboard Page > ', () {
    testWidgets('afterFirstlayout', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: OnboardPage(),
        routes: {
          Routes.WELCOME: (_) => Container(),
        },
      ));

      expect(find.text("Next"), findsOneWidget);

      await tester.tap(find.text("Next"));
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.text("Next"), findsOneWidget);
      await tester.tap(find.text("Next"));
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.text("Get Started"), findsOneWidget);
      await tester.tap(find.text("Get Started"));
      await tester.pumpAndSettle();
      expect(find.text("Get Started"), findsNothing);
    });
  });
}
