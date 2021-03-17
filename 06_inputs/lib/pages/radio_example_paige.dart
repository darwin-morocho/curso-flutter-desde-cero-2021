import 'package:flutter/material.dart';

class RadioExamplePage extends StatefulWidget {
  RadioExamplePage({Key key}) : super(key: key);

  @override
  _RadioExamplePageState createState() => _RadioExamplePageState();
}

class _RadioExamplePageState extends State<RadioExamplePage> {
  String _favorite = "iOS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select your favorite OS"),
              MyRadio<String>(
                value: "iOS",
                groupValue: _favorite,
                onChanged: (value) {
                  setState(() {
                    _favorite = value;
                  });
                },
                label: "iOS",
              ),
              MyRadio<String>(
                value: "Android",
                groupValue: _favorite,
                onChanged: (value) {
                  setState(() {
                    _favorite = value;
                  });
                },
                label: "Android",
              ),
              MyRadio<String>(
                value: "Windows Phone",
                groupValue: _favorite,
                onChanged: (value) {
                  setState(() {
                    _favorite = value;
                  });
                },
                label: "Windows Phone",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRadio<T> extends StatelessWidget {
  final T value, groupValue;
  final void Function(T) onChanged;
  final String label;

  const MyRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 30,
          child: Radio<T>(
            value: this.value,
            groupValue: this.groupValue,
            onChanged: this.onChanged,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(this.label),
        )
      ],
    );
  }
}
