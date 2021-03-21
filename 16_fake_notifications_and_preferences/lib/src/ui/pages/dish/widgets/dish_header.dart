// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';

class DishHeader extends StatelessWidget {
  const DishHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 8,
      child: Builder(
        builder: (context) {
          final controller = Provider.of<DishController>(context, listen: false);
          return Hero(
            tag: controller.tag,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    controller.dish.photo,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.8),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.white30,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
