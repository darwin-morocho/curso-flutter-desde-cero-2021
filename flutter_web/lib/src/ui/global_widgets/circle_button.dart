import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/global_widgets/svg_from_asset.dart';
import 'package:ui_ux/src/utils/colors.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String iconPath;
  final double size;
  final Color backgroundColor, iconColor;

  CircleButton({
    Key? key,
    required this.onPressed,
    required this.iconPath,
    this.size = 40,
    this.backgroundColor = primaryColor,
    this.iconColor = Colors.white,
  })  : assert(size > 0),
        assert(iconPath.contains(".svg")),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: this.onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: this.size,
        height: this.size,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: SvgFromAsset(
          path: this.iconPath,
          color: this.iconColor,
        ),
      ),
    );
  }
}
