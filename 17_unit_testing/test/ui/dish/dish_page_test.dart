import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_widgets/dish_counter.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_page.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/home_tab/widgets/dish_item.dart';

import '../../dependency_injection.dart';
import '../../utils/mock_pages.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  testWidgets('DishPage', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        mockPages(
          routes: {
            Routes.DISH: (_) => DishPage(),
          },
        ),
      );

      expect(find.byType(FloatingActionButton), findsNothing);

      final itemsFinder = find.byType(DishHomeItem);
      await tester.pump(Duration(milliseconds: 310));
      await tester.tap(itemsFinder.first);
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.text("Add to cart"), findsWidgets);
      // Key('add-to-favorite-btn')
      final scaffoldContext = tester.state(find.byType(Scaffold)).context;
      final controller = scaffoldContext.read<DishController>();
      expect(controller.isFavorite, false);

      final favoriteButtonFinder = find.byKey(Key('add-to-favorite-btn'));
      expect(favoriteButtonFinder, findsOneWidget);
      await tester.ensureVisible(favoriteButtonFinder);
      await tester.tap(favoriteButtonFinder);
      await tester.pump();
      expect(controller.isFavorite, true);

      final counterButtonsFinder = find.descendant(
        of: find.byType(DishCounter),
        matching: find.byType(CupertinoButton),
      );

      await tester.tap(counterButtonsFinder.last);
      await tester.pump();
      expect(controller.dish.counter, 1);
      await tester.tap(counterButtonsFinder.last);
      await tester.pump();
      expect(controller.dish.counter, 2);
      await tester.tap(counterButtonsFinder.first);
      await tester.pump();
      expect(controller.dish.counter, 1);

      await tester.tap(find.text("Add to cart"));
      await tester.pump();
      expect(find.text("Update Order"), findsWidgets);
      Navigator.pop(scaffoldContext);
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
