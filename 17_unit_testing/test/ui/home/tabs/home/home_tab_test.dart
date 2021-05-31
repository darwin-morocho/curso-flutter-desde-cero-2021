import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_page.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/home_tab/widgets/dish_item.dart';

import '../../../../dependency_injection.dart';
import '../../../../utils/mock_pages.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  testWidgets('HomeTab', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(mockPages(routes: {
        Routes.DISH: (_) => DishPage(),
      }));
      final itemsFinder = find.byType(DishHomeItem);
      expect(itemsFinder, findsNothing);
      await tester.pump(Duration(milliseconds: 310));
      expect(itemsFinder, findsWidgets);
      await tester.tap(itemsFinder.first);
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.text("Add to cart"), findsOneWidget);
    });
  });
}
