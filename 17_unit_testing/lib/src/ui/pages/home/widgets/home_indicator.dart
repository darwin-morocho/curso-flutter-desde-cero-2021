import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ui_ux/src/utils/colors.dart';

class HomeTabBarIndicator extends Decoration {
  final Color color;
  final double size;

  HomeTabBarIndicator({
    this.color = primaryColor,
    this.size = 5,
  }) : assert(size > 0);

  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) {
    return _CustomPainter(this.color, this.size);
  }
}

class _CustomPainter extends BoxPainter {
  final Color color;
  final double size;

  _CustomPainter(this.color, this.size);

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final Paint paint = Paint();
    paint.color = this.color;
    final width = configuration.size!.width;
    final height = configuration.size!.height;
    final Offset pos = Offset(offset.dx + width / 2, offset.dy + height - 5);
    canvas.drawCircle(pos, this.size / 2, paint);
  }
}
