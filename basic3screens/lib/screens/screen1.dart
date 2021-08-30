import 'package:basic3screens/widgets/drawer.dart';
import 'package:basic3screens/widgets/subscreen1.dart';
import 'package:basic3screens/widgets/subscreen2.dart';
import 'package:basic3screens/widgets/subscreen3.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final routeArg =
    //     ModalRoute.of(context).settings.arguments as Map<String, Object>;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawerScrimColor: Colors.red[900],
        // drawerScrimColor: Colors.redAccent.withOpacity(.5),
        drawer: MyDrawer(),
        appBar: AppBar(
            // title: Text("screen1"),
            backgroundColor: Colors.green,
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: ("SubScreen1"),
              ),
              Tab(
                icon: Icon(Icons.person),
                text: ("SubScreen2"),
              ),
              Tab(
                icon: Icon(Icons.pages),
                text: ("SubScreen3"),
              ),
            ])),
        body: TabBarView(
          children: [
            // InkWell(
            //   child: Text("Go To Screen 2", style: TextStyle(fontSize: 30)),
            //   onTap: () => selectScreen(context),
            // ),
            SubScreen1(),
            SubScreen2(),
            SubScreen3(),
            // Text("Hi", style: TextStyle(fontSize: 30, color: Colors.redAccent)),
            // Text(routeArg['name'],
            //     style: TextStyle(fontSize: 30, color: Colors.redAccent)),
          ],
        ),
      ),
    );
  }
}
