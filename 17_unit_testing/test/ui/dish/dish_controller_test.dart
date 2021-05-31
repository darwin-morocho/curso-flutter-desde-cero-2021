import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';

import '../../dependency_injection.dart';

void main() {
  setUpAll(() async {
    await TestDependencyInjection.initialize();
  });

  tearDownAll(() {
    TestDependencyInjection.clear();
  });

  group('DishController >', () {
    late DishController controller;
    setUp(() {
      final dish = Dish(
        id: 1,
        name: "",
        photo: "",
        price: 9.99,
        rate: null,
        description: "",
      );
      final args = DishPageArguments(tag: "123", dish: dish);
      controller = DishController(args, false);
    });

    test('onCounterChanged', () {
      expect(controller.dish.counter, 0);
      controller.onCounterChanged(5);
      expect(controller.dish.counter, 5);
    });

    test('toggleFavorite', () async {
      expect(controller.isFavorite, false);
      Completer<bool> completer = Completer();
      controller.addListener(() {
        completer.complete(controller.isFavorite);
      });
      controller.toggleFavorite();
      expect(controller.isFavorite, true);
      expect(await completer.future, true);
    });

    test('dispose', () async {
      Completer<bool> completer = Completer();
      controller.onDispose = () {
        completer.complete(true);
      };
      controller.dispose();
      expect(await completer.future, true);
    });
  });
}
