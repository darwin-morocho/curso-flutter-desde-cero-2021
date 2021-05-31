// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/utils/colors.dart';
import 'package:ui_ux/src/utils/font_styles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteItem extends StatelessWidget {
  final Dish dish;
  const FavoriteItem({Key? key, required this.dish}) : super(key: key);

  void _deleteItem() {
    final homeController = Get.i.find<HomeController>();
    homeController.deleteFavorite(dish);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 5),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: _deleteItem,
          ),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.all(10).copyWith(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  dish.photo,
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: FontStyles.regular,
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "${dish.rate}",
                          style: FontStyles.regular.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
