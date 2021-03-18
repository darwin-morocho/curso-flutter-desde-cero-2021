import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/global_widgets/input_text.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/utils/dialogs.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controlller = context.read<LoginController>();
    ProgressDialog.show(context);
    final User? user = await controlller.submit();
    Navigator.pop(context);
    if (user == null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("ERROR"),
          content: Text("Invalid email or password"),
        ),
      );
    } else {
      // go to home
      Get.i.put<User>(user);
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.HOME,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            prefixIcon: Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            validator: (text) {
              if (text.contains("@")) return null;
              return "Invalid email";
            },
            labelText: "Email",
            textInputAction: TextInputAction.next,
            onChanged: controller.onEmailChanged,
          ),
          SizedBox(height: 20),
          InputText(
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            labelText: "Password",
            textInputAction: TextInputAction.send,
            onChanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text(
                "Forgot Password",
                style: FontStyles.regular,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
              },
            ),
          ),
          SizedBox(height: 20),
          RoundedButton(
            onPressed: () => _submit(context),
            label: "Login",
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 40),
            fullWidth: false,
          ),
        ],
      ),
    );
  }
}
