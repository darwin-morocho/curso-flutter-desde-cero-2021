import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './widgets/my_bottom_navigation_bar.dart';
import 'widgets/image_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color;
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
    this.color = this.colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      body: ListView.builder(
        itemBuilder: (_, int index) {
          return ImageItem();
        },
        itemCount: 200,
      ),
    );
  }
}
