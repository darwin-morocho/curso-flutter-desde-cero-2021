import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/category.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/data/repositories/food_menu_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';

class HomeTabController extends ChangeNotifier {
  final FoodMenuRepository _foodMenuRepository = Get.i.find<FoodMenuRepository>();

  final List<Category> categories = [
    Category(
      iconPath: "assets/pages/home/home_tab/breakfast.svg",
      label: "Breakfast",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/fries.svg",
      label: "Fast food",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dinner.svg",
      label: "Dinner",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dessert.svg",
      label: "Desserts",
    ),
  ];

  List<Dish> _popularMenu = [];
  List<Dish> get popularMenu => _popularMenu;

  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
