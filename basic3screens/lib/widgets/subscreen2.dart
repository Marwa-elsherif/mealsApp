import 'package:flutter/material.dart';

class SubScreen2 extends StatelessWidget {
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
                "assets/images/three.jpg",
                width: 400,
                height: 500,
              ),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
              Text("Lorem Ipsum is simply  222"),
            ],
          ),
        ),
      ),
    );
  }
}
