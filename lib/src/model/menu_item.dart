import 'package:flutter/material.dart';

class BarItem {
  /// ber item icon which shown when item is inactive.
  final IconData icon;

  /// active color of the item, required when use SlidingClippedNavBar.coloredItems
  final Color? activeColor;

  /// inactiveColor color of the item, required when use SlidingClippedNavBar.coloredItems
  final Color? inactiveColor;

  /// ber item text which shown when item is active.
  final String title;
  BarItem({
    required this.title,
    required this.icon,
    this.activeColor,
    this.inactiveColor,
  });
}
