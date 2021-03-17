import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareMenu extends StatelessWidget {
  const ShareMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 4,
                color: Colors.grey.withOpacity(0.5),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Share question",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              _MenuItem(
                icon: Icons.bookmark_border_outlined,
                label: "Add question to Bookmarks",
                onPressed: () {},
              ),
              _MenuItem(
                icon: Icons.ios_share,
                label: "Share question via ...",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  child: Text("Send"),
                  onPressed: () {
                    Navigator.pop(context, "JAJA 😜");
                  },
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final IconData icon;
  const _MenuItem({
    Key key,
    @required this.onPressed,
    @required this.label,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Row(
        children: [
          Icon(
            this.icon,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              this.label,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      onPressed: this.onPressed,
    );
  }
}
