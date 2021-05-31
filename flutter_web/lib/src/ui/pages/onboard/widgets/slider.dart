import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux/src/data/models/onboard_item.dart';
import 'package:ui_ux/src/utils/app/app_utils.dart';
import 'package:ui_ux/src/utils/app/check_web_render.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import '../onboard_controller.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);

    return Expanded(
      child: PageView(
        controller: controller.pageController,
        children: List.generate(
          controller.items.length,
          (index) {
            final OnboardItem item = controller.items[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Expanded(
                    child: AppUtils.isHtml ? Image.network(item.image) : SvgPicture.asset(item.image),
                  ),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: FontStyles.title,
                  ),
                  SizedBox(height: 20),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
