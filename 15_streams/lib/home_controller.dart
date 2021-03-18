import 'dart:math';

class HomeController {
  Stream<int> incrementCounter() async* {
    int max = 10;
    int counter = 0;
    while (counter < max) {
      int seconds = 1 + Random().nextInt(5);

      await Future.delayed(Duration(seconds: seconds));
      yield counter++;
    }
  }
}
