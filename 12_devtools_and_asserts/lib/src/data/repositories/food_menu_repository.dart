import 'package:ui_ux/src/data/models/dish.dart';

abstract class FoodMenuRepository {
  Future<List<Dish>> getPopularMenu();
}
