import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  final int initialValue;
  final Color color;

  const MyCounter({
    Key key,
    this.initialValue = 0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State createState() => MyCounterState();
}

class MyCounterState extends State<MyCounter> {
  int counter;

  @override
  void initState() {
    super.initState();
    this.counter = widget.initialValue;
    print("iniState");
  }

  @override
  void didUpdateWidget(covariant MyCounter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialValue != widget.initialValue) {
      print("reset counter");
      counter = widget.initialValue;
      setState(() {});
    }
  }

  void add() {
    counter++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Counter is"),
          Text(
            "$counter",
            style: TextStyle(fontSize: 30),
          ),
          FloatingActionButton(
            onPressed: this.add,
          )
        ],
      ),
    );
  }
}
