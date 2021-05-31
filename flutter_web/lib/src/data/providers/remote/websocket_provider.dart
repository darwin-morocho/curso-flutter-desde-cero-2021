import 'dart:async';
import 'package:faker/faker.dart';
import 'package:ui_ux/src/data/models/notification.dart';

class WebsocketProvider {
  Future<void> connect(String uri) async {
    await Future.delayed(Duration(seconds: 2));
    _init();
  }

  StreamController<AppNotification> _controller = StreamController.broadcast();

  Stream<AppNotification> get onNotification => _controller.stream;
  Timer? _timer;

  _init() {
    _timer = Timer.periodic(
      Duration(seconds: 10),
      (_) {
        final faker = Faker();
        final notification = AppNotification(
          id: DateTime.now().millisecondsSinceEpoch,
          title: "${faker.lorem.word()} ${faker.lorem.word()}",
          description: faker.lorem.sentence(),
          content: {},
          createdAt: DateTime.now(),
        );
        _controller.sink.add(notification);
      },
    );
  }

  Future<void> disconnect() async {
    _timer?.cancel();
    await _controller.close();
  }
}
