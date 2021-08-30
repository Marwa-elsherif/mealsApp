import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function x;
  var btnStyle = TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.lightGreen,
    shadowColor: Colors.lightGreen,
    padding: EdgeInsets.all(20),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    side: BorderSide(
        color: Colors.lightGreen, width: 0.5, style: BorderStyle.solid),
    textStyle: TextStyle(
      color: Colors.black,
      // fontSize: 10,
      //fontStyle: FontStyle.italic
    ),
  );

  Answer(this.answerText, this.x);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: TextButton(
          onPressed: x,
          child: Text(answerText),
          style: btnStyle,
        ));
  }
}
