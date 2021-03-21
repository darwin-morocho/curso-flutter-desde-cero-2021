import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/data/models/dish.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/favorites_tab/widgets/favorite_item.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favorites = context.select<HomeController, Map<int, Dish>>((_) => _.favorites).values.toList();

    return ListView.builder(
      itemBuilder: (_, index) => FavoriteItem(
        dish: favorites[index],
      ),
      itemCount: favorites.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
