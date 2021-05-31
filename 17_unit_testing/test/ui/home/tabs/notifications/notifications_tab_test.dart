import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:ui_ux/src/data/repositories/websocket_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/websocket_repository_impl.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/notifications_tab/widgets/notification_item.dart';
import 'package:ui_ux/src/ui/pages/home/widgets/home_bottom_bar.dart';

import '../../../../dependency_injection.dart';
import '../../../../mock/mock_websocket_provider.dart';
import '../../../../utils/mock_pages.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
    Get.i.put<WebsocketRepository>(
      WebsocketRepositoryImpl(MockWebsocketProvider(700)),
    );
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  testWidgets('notifications tab', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(mockPages());
      final tabsFinder = find.descendant(
        of: find.byType(HomeBottomBar),
        matching: find.byType(Tab),
      );
      await tester.tap(tabsFinder.at(2));
      await tester.pumpAndSettle(Duration(milliseconds: 310));
      expect(find.byType(NotificationItem), findsNothing);
      await tester.pumpAndSettle(Duration(milliseconds: 100));
      expect(find.byType(NotificationItem), findsWidgets);
    });
  });
}
