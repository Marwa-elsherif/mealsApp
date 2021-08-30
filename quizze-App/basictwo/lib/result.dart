import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int totalScore;

  String get resultPhrase {
    String resultText;
    if (totalScore <= 40) {
      resultText = "you are faill !";
    } else if (totalScore >= 70) {
      resultText = "you are awesome !";
    } else if (totalScore > 40) {
      resultText = "Pretty likable !";
    }
    return resultText;
  }

  var btnStyle = TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.lightGreen,
    shadowColor: Colors.lightGreen,
    padding: EdgeInsets.all(20),
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    side: BorderSide(
        color: Colors.lightGreen, width: 0.5, style: BorderStyle.solid),
    textStyle: TextStyle(
      color: Colors.black,
    ),
  );

  Result(this.reset, this.totalScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        vertical: 150,
        horizontal: 10,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, color: Colors.lightGreen[700]),
            textAlign: TextAlign.center,
          ),
          Text(
            "your total score is = $totalScore",
            style: TextStyle(fontSize: 30, color: b),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: reset,
            child: Text("Restart The App"),
            style: btnStyle,
          )
        ],
      ),
    );
  }
}
