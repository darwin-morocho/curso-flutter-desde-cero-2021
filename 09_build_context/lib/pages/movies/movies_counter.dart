import 'package:build_context/pages/movies/movies_provider.dart';
import 'package:flutter/material.dart';

class MoviesCounter extends StatefulWidget {
  const MoviesCounter({Key key}) : super(key: key);

  @override
  _MoviesCounterState createState() => _MoviesCounterState();
}

class _MoviesCounterState extends State<MoviesCounter> {
  @override
  Widget build(BuildContext context) {
    final counter = MoviesProvider.of(context).counter;
    return Container(
      child: Text("$counter"),
    );
  }
}
