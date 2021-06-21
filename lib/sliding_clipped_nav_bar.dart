library sliding_clipped_nav_bar;

import 'dart:io';

import 'package:flutter/material.dart';
export 'src/menu_item.dart';
import 'src/menu_item.dart';
import 'src/build_bar.dart';

class SlidingClippedNavBar extends StatelessWidget {
  final List<MenuItem> buttons;

  final int selectedIndex;
  final double iconSize;
  final Color activeColor;
  final Color? inactiveColor;

  final OnButtonPressCallback onButtonPressed;
  final Color backgroundColor;

  SlidingClippedNavBar({
    required this.buttons,
    required this.selectedIndex,
    required this.onButtonPressed,
    this.iconSize = 30,
    this.activeColor = const Color(0xFF01579B),
    this.backgroundColor = Colors.white,
    this.inactiveColor,
  })  : assert(buttons.length > 1, 'You must provide minimum 2 Menu items'),
        assert(buttons.length < 5, 'Maximum menu item count is 4'),
        assert(Platform.isIOS || Platform.isAndroid,
            'Only supports android and iOS');

  @override
  Widget build(BuildContext context) {
    return BuildBar(
      buttons: buttons,
      iconSize: iconSize,
      activeColor: activeColor,
      inactiveColor: inactiveColor ?? activeColor.withOpacity(0.3),
      backgroundColor: backgroundColor,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
    );
  }
}
