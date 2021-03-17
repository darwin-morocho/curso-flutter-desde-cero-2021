import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation_and_dialogs/pages/widgets/share_menu.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({Key key}) : super(key: key);

  void _showSimpleDialog(BuildContext context) async {
    final bool isOk = await showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              "Simple Dialog",
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
    if (isOk != null && isOk) {
      print("❌ delete element");
    }
  }

  void _showCupertinoDialog(BuildContext context) async {
    final bool isOk = await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: CupertinoAlertDialog(
          title: Text(
            "Simple Dialog",
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context, true),
            ),
            CupertinoDialogAction(
              child: Text("SHOW lATER"),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
              isDestructiveAction: true,
            ),
          ],
        ),
      ),
    );

    if (isOk != null && isOk) {
      print("isOK TRUE");
    }
  }

  void _pickHero(BuildContext context) async {
    final options = ["Batman", "spiderman", "superman"];

    final String hero = await showCupertinoModalPopup(
      context: context,
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      builder: (_) => CupertinoActionSheet(
        title: Text(
          "Pick a Hero",
          style: TextStyle(color: Colors.black),
        ),
        message: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        ),
        actions: [
          ...List.generate(
            options.length,
            (index) {
              final String option = options[index];
              return CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, option);
                },
                child: Text(option),
              );
            },
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("CANCEL"),
            isDestructiveAction: true,
          )
        ],
      ),
    );
    if (hero != null) {
      print(hero);
    }
  }

  void _showCustomMenu(BuildContext context) async {
    final String data = await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // enableDrag: false,
      // isDismissible: false,
      builder: (_) => ShareMenu(),
    );

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Simple dialog"),
            onTap: () {
              _showSimpleDialog(context);
            },
          ),
          ListTile(
            title: Text("Cupertino dialog"),
            onTap: () {
              _showCupertinoDialog(context);
            },
          ),
          ListTile(
            title: Text("Pick a Hero"),
            onTap: () {
              _pickHero(context);
            },
          ),
          ListTile(
            title: Text("Custom menu"),
            onTap: () {
              _showCustomMenu(context);
            },
          ),
        ],
      ),
    );
  }
}
