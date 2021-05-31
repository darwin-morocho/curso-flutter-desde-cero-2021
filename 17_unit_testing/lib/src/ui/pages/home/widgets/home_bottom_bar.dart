import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/ui/pages/home/widgets/home_indicator.dart';
import 'package:ui_ux/src/utils/colors.dart';
import 'package:badges/badges.dart';

class HomeBottomBar extends StatelessWidget {
  HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);
    final int currentPage = context.select<HomeController, int>((_) => _.currentPage);
    final menuItems = context.select<HomeController, List<BottomBarItem>>((_) => _.menuItems);
    return Container(
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: controller.tabController,
          indicator: HomeTabBarIndicator(),
          tabs: List.generate(
            menuItems.length,
            (index) {
              final item = menuItems[index];
              return BottomBarTab(
                item: item,
                isActive: currentPage == index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomBarTab extends StatelessWidget {
  const BottomBarTab({
    Key? key,
    required this.item,
    required this.isActive,
  }) : super(key: key);

  final BottomBarItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Color color = this.isActive ? primaryColor : Colors.black;
    final content = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        item.icon,
        color: color,
      ),
    );
    return Tab(
      key: Key(item.label),
      icon: item.badgeCount > 0
          ? Badge(
              badgeContent: Text(
                "${item.badgeCount}",
                style: TextStyle(color: Colors.white),
              ),
              child: content,
              animationType: BadgeAnimationType.scale,
            )
          : content,
    );
  }
}
