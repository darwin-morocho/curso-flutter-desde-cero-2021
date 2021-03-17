import 'package:flutter/material.dart';
import 'package:navigation_and_dialogs/pages/settings_page.dart';
import 'package:navigation_and_dialogs/routes/router.dart';
import 'package:navigation_and_dialogs/routes/routes.dart';

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            final canPop = Navigator.canPop(context);
            if (canPop) {
              MyRouter.state.pop("MEEDU.APP");
              // Navigator.pop(context, "MEEDU.APP");
            }
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // final Route route = MaterialPageRoute(
              //   builder: (_) => SettingsPage(),
              // );
              // Navigator.push(context, route);
              // Navigator.pushNamed(context, Routes.settings);
              MyRouter.state.pushNamed(Routes.settings);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.name),
            ],
          ),
        ),
      ),
    );
  }
}
