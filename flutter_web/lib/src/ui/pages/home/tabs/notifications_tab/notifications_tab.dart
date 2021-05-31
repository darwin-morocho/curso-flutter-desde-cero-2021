import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/global_controllers/notifications_controller.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/notifications_tab/widgets/notification_item.dart';

class NotificationsTab extends StatefulWidget {
  NotificationsTab({Key? key}) : super(key: key);

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotificationsController>();
    final notifications = controller.notifications;

    super.build(context);
    return ListView.builder(
      itemBuilder: (_, index) {
        final notification = notifications[index];
        return NotificationItem(notification: notification);
      },
      itemCount: notifications.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
