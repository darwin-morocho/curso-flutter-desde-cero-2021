import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/main.dart';
import 'package:provider_example/src/models/user.dart';
import 'package:provider_example/src/pages/home/home_page.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  void _submit(BuildContext context) {
    final controller = context.read<LoginController>();
    final bool isOk = controller.formKey.currentState.validate();
    if (isOk) {
      final User user = controller.submit();
      if (user == null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("ERROR"),
            content: Text("invalid email or password"),
          ),
        );
        return;
      }

      final Route route = MaterialPageRoute(
        builder: (_) => HomePage(),
      );

      context.read<GlobalState>().user = user;
      Navigator.pushReplacement(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("✅ login form build");
    final LoginController controller = Provider.of<LoginController>(context, listen: false);
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "email",
            ),
            validator: (text) {
              if (text.contains("@")) return null;
              return "Invalid email";
            },
            onChanged: controller.onEmailChanged,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "password",
            ),
            validator: (text) {
              if (text.trim().length > 5) return null;
              return "Invalid password";
            },
            onChanged: controller.onPasswordChanged,
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () => _submit(context),
            child: Text("SEND"),
          ),
        ],
      ),
    );
  }
}
