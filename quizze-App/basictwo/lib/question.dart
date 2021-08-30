import 'package:basictwo/main.dart';
import 'package:flutter/material.dart';

class Quesstion extends StatelessWidget {
  final String questionText;

  const Quesstion(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // margin: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen[700], width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 25, color: b),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
