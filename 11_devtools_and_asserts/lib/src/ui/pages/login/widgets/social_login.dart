import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/global_widgets/circle_button.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Or via social media",
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/facebook.svg",
              backgroundColor: Colors.blueAccent,
            ),
            SizedBox(width: 10),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/google.svg",
              backgroundColor: Colors.redAccent,
            ),
            SizedBox(width: 10),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/apple.svg",
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Don't have an account?",
            ),
            CupertinoButton(
              child: Text(
                "Sign Up",
                style: FontStyles.regular,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.REGISTER);
              },
            )
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
