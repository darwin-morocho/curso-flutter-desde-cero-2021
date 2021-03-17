import 'package:flutter/material.dart';
import 'package:navigation_and_dialogs/pages/home_page.dart';
import 'package:navigation_and_dialogs/routes/router.dart';
import 'package:navigation_and_dialogs/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Got to Home"),
          onPressed: () {
            // final Route route = MaterialPageRoute(
            //   builder: (_) => HomePage(),
            // );
            // Navigator.pushReplacement(context, route);
            MyRouter.state.pushReplacementNamed(Routes.home);
            // Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
      ),
    );
  }
}
