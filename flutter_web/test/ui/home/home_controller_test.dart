import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/ui/global_controllers/notifications_controller.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';

import '../../dependency_injection.dart';
import '../../utils/sleep.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  group('HomeController > ', () {
    late HomeController controller;
    setUp(() {
      controller = HomeController(NotificationsController());
    });
    test('current page == 0', () {
      expect(controller.currentPage, 0);
    });

    test('menuItems .svg', () {
      for (final item in controller.menuItems) {
        expect(item.icon.contains(".svg"), true);
      }
    });

    test('afterFirstLayout notifications', () async {
      int notifyCounter = 0;

      controller.addListener(() {
        print("notifyListeners called");
        notifyCounter++;
      });

      expect(controller.menuItems[2].badgeCount, 0);
      controller.afterFirstLayout();
      await sleep(200);
      expect(controller.menuItems[2].badgeCount > 0, true);
      expect(notifyCounter > 0, true);
    });

    test('toggleFavorite', () {
      expect(controller.favorites.length, 0);
      final dish = Dish(
        id: 1,
        name: "",
        photo: "",
        price: 9.99,
        rate: null,
        description: "",
      );
      controller.toggleFavorite(dish);
      expect(controller.favorites.length > 0, true);
      controller.toggleFavorite(dish);
      expect(controller.favorites.length, 0);
    });

    test('deleteFavorite', () {
      expect(controller.favorites.length, 0);
      final dish = Dish(
        id: 1,
        name: "",
        photo: "",
        price: 9.99,
        rate: null,
        description: "",
      );
      controller.toggleFavorite(dish);
      expect(controller.favorites.length > 0, true);
      controller.deleteFavorite(dish);
      expect(controller.favorites.length, 0);
    });

    test('isFavorite', () async {
      final dish = Dish(
        id: 1,
        name: "",
        photo: "",
        price: 9.99,
        rate: null,
        description: "",
      );
      expect(controller.isFavorite(dish), false);
      controller.toggleFavorite(dish);
      expect(controller.isFavorite(dish), true);
    });

    test('dispose', () async {
      Completer<bool> completer = Completer();
      controller.onDispose = () {
        completer.complete(true);
      };
      expect(controller.disposed, false);
      await controller.dispose();
      expect(await completer.future, true);
      expect(controller.disposed, true);
    });
  });
}
