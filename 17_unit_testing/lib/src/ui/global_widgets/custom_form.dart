import 'package:flutter/material.dart';
import 'input_text.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  CustomForm({Key? key, required this.child}) : super(key: key);

  @override
  CustomFormState createState() => CustomFormState();

  static CustomFormState? of(BuildContext context) {
    return context.findAncestorStateOfType<CustomFormState>();
  }
}

class CustomFormState extends State<CustomForm> {
  Set<InputTextState> _fields = <InputTextState>{};

  bool validate() {
    bool isOk = true;
    for (final InputTextState item in _fields) {
      if (item.errorText != null) {
        isOk = false;
        break;
      }
    }
    return isOk;
  }

  void register(InputTextState field) {
    _fields.add(field);
  }

  void remove(InputTextState field) {
    _fields.remove(field);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
