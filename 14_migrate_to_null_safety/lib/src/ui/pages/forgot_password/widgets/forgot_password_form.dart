import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_widgets/input_text.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/utils/dialogs.dart';

import '../forgot_password_controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<ForgotPasswordController>();
    ProgressDialog.show(context);
    final sent = await controller.submit();
    Navigator.pop(context);
    if (sent) {
      await Dialogs.alert(
        context,
        title: "GOOD",
        dismissible: false,
        description: "We have sent an email ${controller.email}",
      );
      Navigator.pop(context);
    } else {
      Dialogs.alert(
        context,
        title: "Error",
        description: "Email ${controller.email} not found",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 330),
      child: Column(
        children: [
          SizedBox(height: 15),
          SvgPicture.asset(
            'assets/pages/forgot_password/forgot_password.svg',
            width: 250,
          ),
          SizedBox(height: 65),
          InputText(
            prefixIcon: Icon(Icons.email_rounded),
            labelText: "Email",
            onChanged: controller.onEmailChanged,
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
              label: "Send",
              fullWidth: false,
              onPressed: () => _submit(context),
            ),
          ),
        ],
      ),
    );
  }
}
