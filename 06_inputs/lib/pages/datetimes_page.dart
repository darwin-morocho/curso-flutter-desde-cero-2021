import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DateTimesPage extends StatefulWidget {
  @override
  _DateTimesPageState createState() => _DateTimesPageState();
}

class _DateTimesPageState extends State<DateTimesPage> {
  DateTime _selectedDate = DateTime(2021, 1, 15);
  double _volume = 0;

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      print("🥶 $time");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarDatePicker(
                currentDate: DateTime(2021, 1, 1),
                initialDate: _selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                onDateChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
              FlatButton(
                onPressed: _selectDate,
                child: Text(_selectedDate.toString()),
              ),
              FlatButton(
                onPressed: _pickTime,
                child: Text("show Time picker"),
              ),
              CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (Duration duration) {
                  print(duration);
                },
              ),
              Slider(
                min: 0,
                max: 100,
                divisions: 100,
                label: "${_volume.toStringAsFixed(1)}",
                activeColor: Colors.redAccent,
                inactiveColor: Colors.grey,
                value: _volume,
                onChanged: (value) {
                  setState(() {
                    _volume = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
