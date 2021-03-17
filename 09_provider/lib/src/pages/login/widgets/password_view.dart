import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/pages/login/login_controller.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("🤩 build password view");
    // final LoginController controller = context.watch<LoginController>();
    final String password = context.select<LoginController, String>((c) => c.password);
    return Container(
      color: Colors.greenAccent,
      padding: EdgeInsets.all(15),
      child: Text(password),
    );
  }
}
