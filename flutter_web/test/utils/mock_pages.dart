import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_controllers/my_cart_controller.dart';
import 'package:ui_ux/src/ui/pages/home/home_page.dart';

Widget mockPages({Widget? home, Map<String, Widget Function(BuildContext)>? routes}) {
  return ChangeNotifierProvider<MyCartController>(
    create: (_) => MyCartController(),
    builder: (_, __) => MaterialApp(
      home: home ?? HomePage(),
      routes: routes ?? {},
    ),
  );
}
