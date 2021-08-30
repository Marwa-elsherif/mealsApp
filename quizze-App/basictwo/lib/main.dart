import 'package:basictwo/quizze.dart';
import 'package:basictwo/result.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  int _questonIndex = 0;
  int _totalScore = 0;
  int num = 0;
  bool isSwitched = false;

  void back() {
    setState(() {
      if (_questonIndex > 0) {
        _questonIndex--;
        _totalScore -= num;
      }
    });
  }

  void answerQuestion(int score) {
    num = score;
    setState(() {
      _questonIndex++;
      _totalScore += score;
    });
  }

  void _resetQuize() {
    setState(() {
      _questonIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'what\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Green', 'score': 15},
        {'text': 'Blue', 'score': 25},
        {'text': 'Yellow', 'score': 10},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal ?',
      'answers': [
        {'text': 'Fox', 'score': 35},
        {'text': 'Wolf', 'score': 15},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Lion', 'score': 10},
      ],
    },
    {
      'questionText': 'what\'s your favorite person ?',
      'answers': [
        {'text': 'dad', 'score': 40},
        {'text': 'mom', 'score': 20},
        {'text': 'grandma', 'score': 25},
        {'text': 'grandpa', 'score': 10},
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: w,
        appBar: AppBar(
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitched == false) {
                    w = Colors.white;
                    b = Colors.black;
                  }
                });
              },
            ),
          ],
          backgroundColor: Colors.lightGreen,
          title: Text("Quize App"),
        ),
        body: Container(
            child: _questonIndex < _questions.length
                ? Quize(_questions, _questonIndex, answerQuestion)
                : Result(_resetQuize, _totalScore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: back,
          backgroundColor: Colors.lightGreen[700],
        ),
      ),
    );
  }
}

// import 'package:basictwo/text.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // or we can use   TextStyle s = TextStyle(fontSize: 30, color: Colors.white);
//   var g = Colors.green;
//   var b = Colors.blue;
//   var y = Colors.yellow;
//   var br = Colors.brown;
//   var p = Colors.purple;
//   var o = Colors.orange;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent,
//         title: Text(
//           widget.title,
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         alignment: Alignment.center,
//         // لجعل لون الخلفية يغطي الشاشة بالكامل وليس المحتوي فقط  height: double.infinity,
//         margin: EdgeInsets.symmetric(
//           vertical: 8,
//           horizontal: 8,
//         ),
//         // margin:EdgeInsets.only(top: 3.0),
//         //margin:EdgeInsets.only(right: 3.0),
//         padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Container(
//               width: 400,
//               height: 400,
//               color: g,
//             ),
//             Container(
//               width: 200,
//               height: 200,
//               color: b,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: y,
//             ),
//           ],
//         ),

//         //  Row(
//         //   children: [
//         //     Padding(
//         //       padding: const EdgeInsets.all(8.0),
//         //       child:
//         //           // Text("marwaaa",style: s,),
//         //           MyText("marwaaa", s),
//         //     ),
//         //     // Text(
//         //     //   "marwaaa",
//         //     //   style: s,
//         //     // ),
//         //     MyText("Tag", s2),
//         //   ],
//         // ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             g = g == Colors.green ? br : Colors.green;
//             b = b == Colors.blue ? o : Colors.blue;
//             y = y == Colors.yellow ? p : Colors.yellow;
//           });
//         },
//         child: Icon(Icons.pages),
//         tooltip: "change colors",
//       ),
//     );
//   }
// }
