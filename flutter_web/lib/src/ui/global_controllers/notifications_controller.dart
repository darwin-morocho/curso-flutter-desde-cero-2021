import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ui_ux/src/data/models/notification.dart';
import 'package:ui_ux/src/data/repositories/websocket_repository.dart';
import 'package:ui_ux/src/helpers/get.dart';

class NotificationsController extends ChangeNotifier {
  final _wsRepostory = Get.i.find<WebsocketRepository>(lazy: true);

  late StreamSubscription _subscription;
  List<AppNotification> _notifications = [];
  List<AppNotification> get notifications => _notifications;
  StreamController<List<AppNotification>> _notificationsStreamController = StreamController.broadcast();
  Stream<List<AppNotification>> get onNotificationsChanged => _notificationsStreamController.stream;

  NotificationsController() {
    print("🥶");
    _subscription = _wsRepostory.onNotification.listen(this._onNotificationListener);
  }

  void _onNotificationListener(AppNotification notification) {
    print("👀");
    _notifications = [notification, ...notifications];
    _notificationsStreamController.sink.add(_notifications);
    notifyListeners();
  }

  void clear() {
    _notifications = [];
  }

  @override
  void dispose() {
    print("NotificationsController dispose");
    _notificationsStreamController.close();
    _subscription.cancel();
    super.dispose();
  }
}
