import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text("$counter"),
          ),
          TextButton(
            key: Key('tmp'),
            onPressed: () {},
            child: Text("TMP"),
          ),
          TextButton(
            key: Key('add'),
            onPressed: () {
              counter++;
              setState(() {});
            },
            child: Text("ADD"),
          ),
        ],
      ),
    );
  }
}
