import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chronometer extends StatefulWidget {
  @override
  _ChronometerState createState() => _ChronometerState();
}

class _ChronometerState extends State<Chronometer> {
  int milliseconds = 0;
  bool running = false;

  Timer timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void onPressed() {
    if (!this.running) {
      timer = Timer.periodic(Duration(milliseconds: 100), (_) {
        this.milliseconds += 100;
        setState(() {});
      });
      this.running = true;
    } else {
      timer?.cancel();
      this.running = false;
    }

    setState(() {});
  }

  String format() {
    final Duration duration = Duration(milliseconds: this.milliseconds);

    String two(int value) {
      return value >= 10 ? "$value" : "0$value";
    }

    String hours = two(duration.inHours);
    String minutes = two(duration.inMinutes.remainder(60));
    String seconds = two(duration.inSeconds.remainder(60));
    String milliseconds = two(duration.inMilliseconds.remainder(1000));
    return "$hours:$minutes:$seconds:$milliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            this.format(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          CupertinoButton(
            child: Text(running ? "STOP" : "START"),
            onPressed: this.onPressed,
          )
        ],
      ),
    );
  }
}
