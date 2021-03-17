import 'package:flutter/widgets.dart';

class MyRouter {
  MyRouter._();
  static MyRouter instance = MyRouter._();
  GlobalKey<NavigatorState> key = GlobalKey();
  static NavigatorState get state => MyRouter.instance.key.currentState;
}
