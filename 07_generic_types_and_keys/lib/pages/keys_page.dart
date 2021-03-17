import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeysPage extends StatefulWidget {
  @override
  _KeysPageState createState() => _KeysPageState();
}

class _KeysPageState extends State<KeysPage> {
  bool _enabled = true;

  final _key = GlobalKey();

  List<Widget> _textFields = [
    Padding(
      key: ValueKey(1),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: CupertinoTextField(
          placeholder: "input 1",
        ),
      ),
    ),
    SizedBox(
      key: ValueKey(2),
      child: CupertinoTextField(
        placeholder: "input 2",
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_enabled
            ? CupertinoTextField(
                key: _key,
                placeholder: "input 1",
              )
            : Container(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ..._textFields,
            if (_enabled)
              CupertinoTextField(
                key: _key,
                placeholder: "input 1",
              ),
            // else
            //   Container(
            //     color: Colors.redAccent,
            //     padding: EdgeInsets.all(10),
            //     child: CupertinoTextField(
            //       key: _key,
            //       placeholder: "input 1",
            //     ),
            //   ),
            // CupertinoTextField(
            //   key: ValueKey(2),
            //   placeholder: "input 2",
            // ),
            Switch(
              value: _enabled,
              onChanged: (value) {
                _enabled = value;
                // _textFields = _textFields.reversed.toList();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
