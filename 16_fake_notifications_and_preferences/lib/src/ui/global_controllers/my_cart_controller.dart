import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/dish.dart';

class MyCartController extends ChangeNotifier {
  Map<int, Dish> _cart = {};
  Map<int, Dish> get cart => _cart;

  bool isInCart(Dish dish) {
    return _cart.containsKey(dish.id);
  }

  bool get hasItems => _cart.length > 0;

  double get subtotal => double.parse(
        cart.values.map((e) => e.price * e.counter).toList().reduce((v, e) => v + e).toStringAsFixed(2),
      );
  double get taxAndFee => double.parse((subtotal * 0.12 + 1).toStringAsFixed(2));
  double get delivery => 2.0;
  double get total => double.parse((subtotal + taxAndFee + delivery).toStringAsFixed(2));

  int getDishCounter(Dish dish) {
    if (isInCart(dish)) {
      return _cart[dish.id]!.counter;
    }
    return 0;
  }

  void addToCart(Dish dish, {bool update = true}) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    copy[dish.id] = dish;
    _cart = copy;
    if (update) {
      notifyListeners();
    }
  }

  void deleteFromCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    if (copy.containsKey(dish.id)) {
      copy.remove(dish.id);
      _cart = copy;
      notifyListeners();
    }
  }
}
