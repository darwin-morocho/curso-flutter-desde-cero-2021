import 'package:flutter/widgets.dart';
import 'package:navigation_and_dialogs/pages/dialogs_page.dart';
import 'package:navigation_and_dialogs/pages/home_page.dart';
import 'package:navigation_and_dialogs/pages/login_page.dart';
import 'package:navigation_and_dialogs/pages/second_page.dart';
import 'package:navigation_and_dialogs/pages/settings_page.dart';
import 'package:navigation_and_dialogs/routes/routes.dart';

abstract class Pages {
  static const String initialRoute = Routes.dialogs;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.second: (BuildContext context) {
      final String name = ModalRoute.of(context).settings.arguments;
      return SecondPage(name: name);
    },
    Routes.home: (_) => HomePage(),
    Routes.login: (_) => LoginPage(),
    Routes.settings: (_) => SettingsPage(),
    Routes.dialogs: (_) => DialogsPage(),
  };
}
