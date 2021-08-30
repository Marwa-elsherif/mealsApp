import 'package:flutter/material.dart';

class SubScreen1 extends StatelessWidget {
  Text txt = Text("Lorem Ipsum is simply  11111");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/four.jpg",
                width: 400,
                height: 500,
              ),
              txt,
              txt,
              txt,
              txt,
              txt,
              txt,
              txt,
              txt,
              txt
            ],
          ),
        ),
      ),
    );
  }
}
