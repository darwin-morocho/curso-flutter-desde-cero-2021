import 'package:flutter/material.dart';
import 'package:navigation_and_dialogs/routes/pages.dart';
import 'routes/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: Pages.initialRoute,
      routes: Pages.routes,
      navigatorKey: MyRouter.instance.key,
    );
  }
}
