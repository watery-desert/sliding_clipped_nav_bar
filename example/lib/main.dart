import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: [
          Center(
            child: Icon(
              Icons.event,
              size: 56,
              color: Colors.amber,
            ),
          ),
          Center(
            child: Icon(
              Icons.search_rounded,
              size: 56,
              color: Colors.amber,
            ),
          ),
          Center(
            child: Icon(
              Icons.bolt_rounded,
              size: 56,
              color: Colors.amber,
            ),
          ),
          Center(
            child: Icon(
              Icons.tune_rounded,
              size: 56,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        // 24 should be okay
        // activeColor:  Color(0xFF01579B),
        activeColor: Colors.green,
        inactiveColor: Colors.red,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.event,
            title: 'Events',
            // activeColor: Colors.amber,
            // inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            // activeColor: Colors.red,
            // inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.bolt_rounded,
            title: 'Energy',
            // activeColor: Colors.green,
            // inactiveColor: Colors.blue,
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings',
            // activeColor: Colors.purple,
            // inactiveColor: Colors.brown,
          ),
        ],
      ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons
