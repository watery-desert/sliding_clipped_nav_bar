library sliding_clipped_nav_bar;

import 'package:flutter/material.dart';
export 'src/menu_item.dart';
import 'src/menu_item.dart';
import 'src/build_bar.dart';

class SlidingClippedNavBar extends StatelessWidget {
  /// List of bar items that shows horizontally.
  final List<BarItem> barItems;

  /// Selected index of the bar items.
  final int selectedIndex;

  /// Size of all icons (inactive items), don't make it too big or will be clipped.
  final double iconSize;

  /// Color of the selected item which indicate selected.
  final Color activeColor;

  /// Inactive color of item, which actually color icons.
  final Color? inactiveColor;

  /// Callback when item is pressed.
  final OnButtonPressCallback onButtonPressed;

  /// background color of the bar.
  final Color backgroundColor;

  SlidingClippedNavBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    this.iconSize = 30,
    this.activeColor = const Color(0xFF01579B),
    this.backgroundColor = Colors.white,
    this.inactiveColor,
  })  : assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4');

  @override
  Widget build(BuildContext context) {
    return BuildBar(
      buttons: barItems,
      iconSize: iconSize,
      activeColor: activeColor,
      inactiveColor: inactiveColor ?? activeColor.withOpacity(0.3),
      backgroundColor: backgroundColor,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
    );
  }
}
