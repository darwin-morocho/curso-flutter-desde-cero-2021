import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_widgets/custom_form.dart';
import 'package:ui_ux/src/ui/global_widgets/input_text.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/utils/dialogs.dart';

import '../register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controlller = context.read<RegisterController>();
    final isFormOk = controlller.formKey.currentState.validate();
    if (isFormOk) {
      ProgressDialog.show(context);
      final isOk = await controlller.submit();
      Navigator.pop(context);
      if (!isOk) {
        Dialogs.alert(
          context,
          title: "ERROR",
          description: "Register fail",
        );
      } else {
        // go to home
        await Dialogs.alert(
          context,
          title: "GOOD",
          dismissible: false,
          description: "Register Ok",
          okText: "Go to login",
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "Invalid Inputs",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();
    return CustomForm(
      key: controller.formKey,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 330),
        child: Column(
          children: [
            InputText(
              labelText: "Name",
              validator: (text) {
                return text.trim().length > 1 ? null : "Invalid name";
              },
              prefixIcon: Icon(
                Icons.person_outline,
              ),
              onChanged: controller.onNameChanged,
            ),
            SizedBox(height: 15),
            InputText(
              labelText: "Last Name",
              validator: (text) {
                return text.trim().length > 1 ? null : "invalid lastname";
              },
              prefixIcon: Icon(
                Icons.person_add_outlined,
              ),
              onChanged: controller.onLastnameChanged,
            ),
            SizedBox(height: 15),
            InputText(
              labelText: "Email",
              validator: (text) {
                return text.contains("@") ? null : "Invalid email";
              },
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: controller.onEmailChanged,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                label: "Sign Up",
                fullWidth: false,
                onPressed: () {
                  _submit(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
