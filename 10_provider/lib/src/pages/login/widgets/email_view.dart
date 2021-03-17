import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/pages/login/login_controller.dart';

class EmailView extends StatelessWidget {
  const EmailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("🎃 build email view");
    final String email = context.select<LoginController, String>((c) => c.email);
    return Container(
      color: Colors.redAccent,
      padding: EdgeInsets.all(15),
      child: Text(email),
    );
  }
}
