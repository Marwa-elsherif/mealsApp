import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var s = TextStyle(fontSize: 30, color: Colors.white);
TextStyle s2 = TextStyle(fontSize: 30, color: Colors.black);

class MyText extends StatelessWidget {
  String _text;
  TextStyle _textStyle;

  MyText(this._text, this._textStyle);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _textStyle,
    );
  }
}
