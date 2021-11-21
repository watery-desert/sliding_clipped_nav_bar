import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';


Widget baseStructure(List<BarItem> items, bool colorful) => MaterialApp(
      home: Material(
        child: colorful? SlidingClippedNavBar.colorful(
          onButtonPressed: (_) {},
          selectedIndex: 0,
          barItems: items,
        ):  SlidingClippedNavBar(
          activeColor: Colors.blue,
          onButtonPressed: (_) {},
          selectedIndex: 0,
          barItems: items,
        ),
      ),
    );

