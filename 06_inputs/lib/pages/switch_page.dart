import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  SwitchPage({Key key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _enabled = false;
  String _day = "LU";
  final List<String> _days = ["LU", "MA", "MI", "JU", "VI", "SA", "DO"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                value: _enabled,
                title: Text("Push notifications"),
                onChanged: (value) {
                  setState(() {
                    _enabled = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: _day,
                items: List.generate(
                  _days.length,
                  (index) => DropdownMenuItem<String>(
                    child: Text(_days[index]),
                    value: _days[index],
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _day = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
