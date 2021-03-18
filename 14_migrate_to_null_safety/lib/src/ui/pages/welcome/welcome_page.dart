import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/global_widgets/circle_button.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(
                    "assets/pages/welcome/welcome.svg",
                  ),
                ),
              ),
              Text(
                "Welcome",
                style: FontStyles.title,
              ),
              SizedBox(height: 20),
              Text(
                "Excepteur sint occaecat cupidatat non\nproident sunt in culpa qui officia",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 280,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.LOGIN);
                        },
                        label: "Login",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.REGISTER);
                        },
                        label: "Sign Up",
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
