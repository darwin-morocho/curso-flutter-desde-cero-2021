import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';
import 'package:ui_ux/src/ui/pages/dish/widgets/add_to_cart_button.dart';
import 'package:ui_ux/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'widgets/dish_detail.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key? key}) : super(key: key);

  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final homeController = Get.i.find<HomeController>();
        final DishPageArguments args = ModalRoute.of(context)!.settings.arguments as DishPageArguments;
        final isFavorite = homeController.isFavorite(args.dish);
        final controller = DishController(args, isFavorite);
        _setStatusBar(true);
        controller.onDispose = () => _setStatusBar(false);
        return controller;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AddToCartButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DishHeader(),
                DishDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
