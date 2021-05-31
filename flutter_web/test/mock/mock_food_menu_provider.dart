import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/data/providers/remote/food_menu_provider.dart';

class MockFoodMenuProvider implements FoodMenuProvider {
  @override
  Future<List<Dish>> getPopularMenu() async {
    await Future.delayed(Duration(milliseconds: 300));
    return [
      Dish(
        id: 1,
        name: "",
        photo: "",
        price: 9.99,
        rate: null,
        description: "",
      ),
    ];
  }
}
