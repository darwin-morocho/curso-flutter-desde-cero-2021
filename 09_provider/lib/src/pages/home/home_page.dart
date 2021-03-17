import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/main.dart';
import 'package:provider_example/src/pages/login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = context.watch<GlobalState>();
    final user = globalState.user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.name),
          Text(user.email),
          Text(user.birthday.toString()),
          FlatButton(
            onPressed: () {
              globalState.user = null;
              final Route route = MaterialPageRoute(
                builder: (_) => LoginPage(),
              );

              Navigator.pushAndRemoveUntil(
                context,
                route,
                (route) => false,
              );
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
