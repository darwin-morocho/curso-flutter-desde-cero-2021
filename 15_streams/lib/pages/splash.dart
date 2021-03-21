import 'package:flutter/material.dart';
import 'package:streams/pages/home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final route = MaterialPageRoute(builder: (_) => MyHomePage(title: ''));
      Navigator.push(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
