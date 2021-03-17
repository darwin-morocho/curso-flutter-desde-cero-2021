import 'package:flutter/material.dart';
import 'package:navigation_and_dialogs/pages/login_page.dart';
import 'package:navigation_and_dialogs/routes/router.dart';
import 'package:navigation_and_dialogs/routes/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FlatButton(
            child: Text("Go to first page"),
            onPressed: () {
              // Navigator.popUntil(context, (route) {
              //   return route.settings.name == '/';
              // });

              MyRouter.state.popUntil(
                (route) => route.settings.name == Routes.home,
              );
            },
          ),
          FlatButton(
            child: Text("Sign out"),
            onPressed: () {
              // final Route route = MaterialPageRoute(
              //   builder: (_) => LoginPage(),
              // );
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   route,
              //   (_) => false,
              // );

              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   Routes.login,
              //   (route) => false,
              // );

              MyRouter.state.pushNamedAndRemoveUntil(Routes.login, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
