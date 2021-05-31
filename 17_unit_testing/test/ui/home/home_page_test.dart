import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_controllers/my_cart_controller.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/ui/pages/home/home_page.dart';
import 'package:ui_ux/src/ui/pages/home/widgets/home_bottom_bar.dart';

import '../../dependency_injection.dart';
import '../../utils/mock_pages.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  testWidgets('HomePage TabbarView', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(mockPages());
      //
      final tabBarViewFinder = find.byType(TabBarView);
      expect(tabBarViewFinder, findsOneWidget);

      //
      final homeController = tester.state(tabBarViewFinder).context.read<HomeController>();

      //
      final favorites = homeController.menuItems[1].label;
      //
      final favoritesTabFinder = find.byKey(Key(favorites));
      await tester.tap(favoritesTabFinder);

      //
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      //
      expect(homeController.currentPage, 1);
    });
  });
}
