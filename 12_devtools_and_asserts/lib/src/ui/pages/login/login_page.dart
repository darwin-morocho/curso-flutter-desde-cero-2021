import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import 'login_controller.dart';
import 'widgets/login_form.dart';
import 'widgets/social_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  height: size.height - padding.top - padding.bottom,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Welcome Back!",
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/pages/welcome/welcome.svg',
                        ),
                      ),
                      LoginForm(),
                      SocialLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
