import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/dish.dart';

class DishPageArguments {
  final String tag;
  final Dish dish;

  DishPageArguments({
    required this.tag,
    required this.dish,
  });
}

class DishController extends ChangeNotifier {
  final String tag;
  Dish dish;
  VoidCallback? onDispose;

  DishController(DishPageArguments arguments, this._isFavorite)
      : this.dish = arguments.dish,
        this.tag = arguments.tag;

  bool _isFavorite;
  bool get isFavorite => _isFavorite;

  void onCounterChanged(int counter) {
    this.dish = this.dish.updateCounter(counter);
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  @override
  void dispose() {
    if (onDispose != null) {
      onDispose!();
    }
    super.dispose();
  }
}
