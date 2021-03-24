import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/data/models/user.dart';
import 'package:ui_ux/src/helpers/get.dart';
import 'package:ui_ux/src/routes/routes.dart';
import 'package:ui_ux/src/ui/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashController>(
      lazy: false,
      create: (_) {
        final controller = SplashController();
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        controller.onAfterFirstLayout = (user, isReady) {
          String routeName = isReady ? Routes.LOGIN : Routes.ONBOARD;

          if (user != null) {
            routeName = Routes.HOME;
            Get.i.put<User>(user);
          }
          Navigator.pushReplacementNamed(context, routeName);
        };
        return controller;
      },
      builder: (_, __) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
