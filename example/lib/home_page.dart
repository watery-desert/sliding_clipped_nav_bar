import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';


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
        activeColor: Colors.blue[900]!,
        selectedIndex: selectedIndex,
        buttons: [
          MenuItem(
            icon: Icons.event,
            title: 'Events',
          ),
          MenuItem(
            icon: Icons.search_rounded,
            title: 'Search',
          ),
          MenuItem(
            icon: Icons.bolt_rounded,
            title: 'Energy',
          ),
          MenuItem(
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
