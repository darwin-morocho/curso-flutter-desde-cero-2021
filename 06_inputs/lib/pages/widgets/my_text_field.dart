import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final void Function(String) onChanged;
  final String label, hint;
  final IconData icon;
  final FocusNode focusNode;
  final bool obscureText;
  final String defaultValue;
  final void Function(String) onSubmitted;

  const MyTextField({
    Key key,
    this.onChanged,
    this.label = "",
    this.hint = "",
    @required this.icon,
    this.obscureText = false,
    this.defaultValue,
    this.focusNode,
    this.onSubmitted,
  }) : super(key: key);
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _hasFocus = false, _obscureText;
  FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    if (widget.defaultValue != null) {
      _controller.text = widget.defaultValue;
    }

    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _hasFocus ? Colors.redAccent : Colors.black;
    return TextField(
      focusNode: _focusNode,
      obscureText: _obscureText,
      controller: _controller,
      style: TextStyle(color: Colors.blue),
      keyboardAppearance: Brightness.light,
      textInputAction: TextInputAction.next,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        labelStyle: TextStyle(color: color),
        prefixIcon: Icon(
          widget.icon,
          color: color,
        ),
        suffixIcon: widget.obscureText
            ? FlatButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                minWidth: 30,
                padding: EdgeInsets.all(10),
                child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : FlatButton(
                onPressed: () {
                  _controller.text = "";
                },
                minWidth: 30,
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.clear,
                ),
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
