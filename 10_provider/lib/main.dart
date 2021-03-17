import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/pages/login/login_page.dart';

import 'src/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalState>(
          create: (_) => GlobalState(),
        ),
        ChangeNotifierProvider<CounterController>(
          create: (_) => CounterController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class GlobalState {
  User user;
}

class CounterController extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
