import 'package:basic3screens/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'screens/screen2.dart';
import 'screens/screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/x1': (context) => Screen1(),
        '/x2': (context) => Screen2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;
  List<dynamic> pages = [
    {'page': Image.asset("assets/images/four.jpg"), 'title': 'Home Page'},
    {'page': Screen1(), 'title': 'Screen1'},
    {'page': Screen2(), 'title': 'Screen2'},
    Screen2(),
  ];
  void _navigateFunc(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(),
        drawerScrimColor: Colors.red[900],
        // drawerScrimColor: Colors.redAccent.withOpacity(.5),

        appBar: AppBar(
          title: Text(pages[_selectedPageIndex]['title']),
          backgroundColor: Colors.red[900],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          onTap: _navigateFunc,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv), label: "screen1"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "screen2"),
          ],
        ),
        body: pages[_selectedPageIndex]['page'],

// InkWell(
        //   child: Text("Go To Screen1", style: TextStyle(fontSize: 30)),
        //   onTap: () => selectScreen(context, 1),
        // ),
        // InkWell(
        //   child: Text("Go To Screen2", style: TextStyle(fontSize: 30)),
        //   onTap: () => selectScreen(context, 2),
        // ),
      ),
    );
  }
}
