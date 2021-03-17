import 'package:build_context/pages/movies/movies_page.dart';
import 'package:flutter/material.dart';

class MoviesProvider extends InheritedWidget {
  final Widget child;
  final MoviesBloc bloc;
  final int counter;

  final void Function(VoidCallback) setState;

  MoviesProvider({
    @required this.child,
    @required this.bloc,
    @required this.setState,
    @required this.counter,
  }) : assert(child != null);

  @override
  bool updateShouldNotify(covariant MoviesProvider oldWidget) {
    print("✅ ${oldWidget.counter}");
    // return oldWidget.counter != counter;
    return true;
  }

  static MoviesProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MoviesProvider>();
  }
}
