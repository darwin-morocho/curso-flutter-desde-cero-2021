import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux/src/utils/app/app_utils.dart';

class SvgFromAsset extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width, height;
  const SvgFromAsset({
    Key? key,
    required this.path,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppUtils.isHtml
        ? Image.network(
            path,
            color: this.color,
            width: width,
            height: height,
          )
        : SvgPicture.asset(
            path,
            color: this.color,
            width: width,
            height: height,
          );
  }
}
