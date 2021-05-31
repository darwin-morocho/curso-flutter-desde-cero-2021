import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/data/models/category.dart';
import 'package:ui_ux/src/ui/global_widgets/svg_from_asset.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeTabController>(context, listen: false);
    return Container(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          controller.categories.length,
          (index) {
            final category = controller.categories[index];
            return CategoryButton(
              category: category,
              isFirst: index == 0,
            );
          },
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.category,
    required this.isFirst,
  }) : super(key: key);

  final Category category;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
        left: isFirst ? 17 : 5,
        bottom: 10,
        top: 5,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: SvgFromAsset(
                  path: category.iconPath,
                  width: 80,
                ),
              ),
              SizedBox(height: 15),
              Text(
                category.label,
                style: FontStyles.regular.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
