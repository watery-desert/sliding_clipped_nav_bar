import 'package:flutter/material.dart';

class BarItem {
  /// bar item icon which is shown when item is inactive.
  final IconData icon;

  /// bar item text which is shown when item is active.
  final String title;
  
  /// bar item color which is used when the item is active
  final Color? inactiveColor;
  
  /// bar item color which is used when the item is active
  final Color? activeColor;
  
  
  BarItem({
    required this.title,
    required this.icon,
    this.inactiveColor,
    this.activeColor
  });
}
