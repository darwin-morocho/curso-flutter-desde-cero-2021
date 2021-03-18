import 'package:flutter/material.dart';

class NotificationsTab extends StatefulWidget {
  NotificationsTab({Key? key}) : super(key: key);

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      alignment: Alignment.center,
      child: Text("notifications"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
