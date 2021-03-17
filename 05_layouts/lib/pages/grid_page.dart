import 'package:flutter/material.dart';
import 'package:hello_world/pages/widgets/image_item.dart';

class GridPage extends StatelessWidget {
  const GridPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        itemBuilder: (_, index) => ImageItem(),
        itemCount: 100,
      ),
    );
  }
}
