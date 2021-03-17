import 'package:flutter/material.dart';
import 'package:navigation_and_dialogs/pages/second_page.dart';
import 'package:navigation_and_dialogs/routes/router.dart';
import 'package:navigation_and_dialogs/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("First Page"),
              SizedBox(height: 20),
              FlatButton(
                onPressed: () async {
                  // final Route route = MaterialPageRoute<String>(
                  //   builder: (_) => SecondPage(
                  //     name: "Darwin Morocho",
                  //   ),
                  // );
                  // Navigator.pushReplacement(context, route);
                  // final String data = await Navigator.push<String>(context, route);
                  // print("🥶 $data");

                  // final data = await Navigator.pushNamed(context, Routes.second, arguments: "MEEDU.APP") as String;
                  // print("🥶 $data");

                  final data = await MyRouter.state.pushNamed(Routes.second, arguments: "MEEDU.APP");
                  print("🥶 $data");
                },
                color: Colors.redAccent,
                child: Text("Go to second page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
