import 'package:flutter/material.dart';
import 'package:basic3screens/main.dart';
import 'package:basic3screens/screens/screen1.dart';
import 'package:basic3screens/screens/screen1.dart';

class MyDrawer extends StatelessWidget {
  static void selectScreen(BuildContext ctx, int screenNum) {
    Navigator.of(ctx).pushNamed(
        screenNum == 1
            ? '/x1'
            : (screenNum == 2)
                ? '/x2'
                : '/home',
        arguments: {
          'name': screenNum == 1 ? 'marwa' : 'Marwa Tag Elshreef',
          'id': screenNum == 1 ? 10 : 54664646,
          'title': screenNum == 1 ? 'info 1' : 'info2',
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text("Go To Screen1", style: TextStyle(fontSize: 15)),
              onTap: () => selectScreen(context, 1),
              subtitle: Text("sub title Screen1"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Go To Screen2", style: TextStyle(fontSize: 15)),
              onTap: () => selectScreen(context, 2),
              subtitle: Text("sub title Screen2"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Go To Home", style: TextStyle(fontSize: 15)),
              onTap: () => selectScreen(context, 0),
              subtitle: Text("Home page"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
