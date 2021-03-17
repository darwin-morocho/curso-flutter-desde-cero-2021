import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class RandomText extends StatefulWidget {
  final void Function(Size) onSizeChanged;

  const RandomText({Key key, @required this.onSizeChanged}) : super(key: key);
  @override
  _RandomTextState createState() => _RandomTextState();
}

class _RandomTextState extends State<RandomText> {
  String _text = '';

  @override
  void initState() {
    super.initState();
    _text = Faker().lorem.sentence();
    _getSize();
  }

  void _getSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject();
      widget.onSizeChanged(renderBox.size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _text = Faker().lorem.sentence();
        setState(() {});
        _getSize();
      },
      child: Container(
        color: Colors.grey,
        child: Text(_text),
      ),
    );
  }
}
