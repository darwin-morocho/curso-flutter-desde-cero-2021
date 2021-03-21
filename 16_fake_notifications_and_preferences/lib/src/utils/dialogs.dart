import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? description,
    String okText = "OK",
    bool dismissible = true,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => WillPopScope(
        onWillPop: () async => dismissible,
        child: CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: description != null ? Text(description) : null,
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(okText),
            ),
          ],
        ),
      ),
    );
  }

  static Future<bool> confirm(
    BuildContext context, {
    String? title,
    String? description,
    String okText = "OK",
  }) async {
    final result = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (_) => WillPopScope(
        child: CupertinoActionSheet(
          title: title != null ? Text(title) : null,
          message: description != null ? Text(description) : null,
          actions: [
            CupertinoActionSheetAction(
              child: Text(okText),
              onPressed: () {
                Navigator.pop(_, true);
              },
            ),
            CupertinoActionSheetAction(
              child: Text("CANCEL"),
              onPressed: () {
                Navigator.pop(_, false);
              },
              isDestructiveAction: true,
            )
          ],
        ),
        onWillPop: () async => false,
      ),
    );
    return result ?? false;
  }
}

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Colors.white30,
          child: CupertinoActivityIndicator(
            radius: 15,
          ),
        ),
      ),
    );
  }
}
