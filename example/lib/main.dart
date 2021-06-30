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
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.event,
              size: 56,
              color: Colors.amber[300],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.search,
              size: 56,
              color: Colors.red[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.bolt,
              size: 56,
              color: Colors.green[400],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.tune_rounded,
              size: 56,
              color: Colors.blue[400],
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
          _pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.event,
            title: 'Events',
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
          ),
          BarItem(
            icon: Icons.bolt_rounded,
            title: 'Energy',
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings',
          ),
        ],
      ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons
