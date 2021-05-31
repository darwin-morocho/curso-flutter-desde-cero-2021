import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/utils/font_styles.dart';
import 'dish_item.dart';

class HorizontalDishes extends StatelessWidget {
  final List<Dish> dishes;
  final String title;
  final VoidCallback? onViewAll;
  const HorizontalDishes({
    Key? key,
    required this.dishes,
    required this.title,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width * 0.6;
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: FontStyles.title,
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(10),
                  minSize: 25,
                  child: Text(
                    "View All",
                    style: FontStyles.regular,
                  ),
                  onPressed: this.onViewAll,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final item = dishes[index];
                return DishHomeItem(
                  key: UniqueKey(),
                  item: item,
                  isFirst: index == 0,
                );
              },
              itemCount: dishes.length,
            ),
          ),
        ],
      ),
    );
  }
}
