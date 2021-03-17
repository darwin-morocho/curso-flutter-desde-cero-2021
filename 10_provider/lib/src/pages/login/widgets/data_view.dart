import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/pages/login/login_controller.dart';

class DataView extends StatelessWidget {
  const DataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("✅ DataView build");
    // final LoginController controller = context.watch<LoginController>();
    final LoginController controller = Provider.of<LoginController>(context);
    return Container(
      child: Column(
        children: [
          Text(controller.email),
          Text(controller.password),
        ],
      ),
    );
  }
}
