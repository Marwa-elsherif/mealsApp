import 'package:flutter/material.dart';

class SubScreen3 extends StatelessWidget {
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
                "assets/images/two.jpg",
                width: 300,
                height: 400,
              ),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply  3"),
              Text("Lorem Ipsum is simply 3"),
              Text("Lorem Ipsum is simply 3"),
            ],
          ),
        ),
      ),
    );
  }
}
