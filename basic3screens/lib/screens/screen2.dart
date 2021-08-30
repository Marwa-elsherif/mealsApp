import 'package:basic3screens/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      drawerScrimColor: Colors.red[900],
      body: Container(
        child: Column(
          children: [
            // Text("Hi", style: TextStyle(fontSize: 30, color: Colors.redAccent)),
            // Text(routeArg['name'],
            //     style: TextStyle(fontSize: 30, color: Colors.redAccent)),
            // InkWell(
            //   child: Text("Go To Screen1", style: TextStyle(fontSize: 30)),
            //   onTap: () => selectScreen(context),
            // ),
          ],
        ),
      ),
    );
  }
}
