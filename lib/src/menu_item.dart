import 'package:flutter/material.dart';

class BarItem {
  /// ber item icon which shown when item is inactive.
  final IconData icon;

  /// ber item text which shown when item is active.
  final String title;
  BarItem({
    required this.title,
    required this.icon,
  });
}
