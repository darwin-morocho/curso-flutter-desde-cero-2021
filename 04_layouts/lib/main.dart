import 'package:flutter/material.dart';
import 'package:hello_world/pages/grid_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridPage(),
    );
  }
}
