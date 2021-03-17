import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final bool isActive;
  final void Function() onPressed;

  const MyBottomNavigationBarItem({
    Key key,
    @required this.iconData,
    this.isActive = false,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              this.iconData,
              color: isActive ? Colors.black : Color(0xff024DFE),
              size: 30,
            ),
            if (this.isActive)
              Container(
                margin: EdgeInsets.only(top: 5),
                width: 12,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
