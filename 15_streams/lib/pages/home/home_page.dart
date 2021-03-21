import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController _homeController = HomeController(Connectivity());

  @override
  void initState() {
    super.initState();
    _homeController.init();
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<bool>(
              stream: _homeController.onConnectedChanged,
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Text("Connected:: ${snapshot.data}");
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class CounterView extends StatefulWidget {
//   final Stream<int> stream;
//   final int initialValue;

//   const CounterView({Key? key, required this.stream, this.initialValue = 0}) : super(key: key);
//   @override
//   _CounterViewState createState() => _CounterViewState();
// }

// class _CounterViewState extends State<CounterView> {
//   late int _counter;
//   late StreamSubscription _subscription;
//   @override
//   void initState() {
//     super.initState();
//     _counter = widget.initialValue;
//     _subscription = widget.stream.listen((event) {
//       _counter = event;
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("$_counter"),
//     );
//   }
// }
