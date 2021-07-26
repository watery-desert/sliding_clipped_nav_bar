library sliding_clipped_nav_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
export 'src/menu_item.dart';
import 'src/menu_item.dart';
import 'src/build_bar.dart';

class SlidingClippedNavBar extends StatelessWidget {
  /// List of bar items shown horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  /// Selected index of the bar items.
  final int selectedIndex;

  /// Size of all icons (inactive items), don't make it too big or will be clipped.
  final double iconSize;

  /// Size of all text, don't make it too big or will be clipped
  final double textSize;

  /// Size of the bottom bar
  final double barHeight;

  /// Color of the selected item which indicate selected.
  final Color? _activeColor;

  /// Inactive color of item, which actually color icons.
  final Color? _inactiveColor;

  /// Callback when item is pressed.
  final OnButtonPressCallback onButtonPressed;

  /// background color of the bar.
  final Color backgroundColor;

  /// custom bar decoration
  final BoxDecoration? _barDecoration;

  /// custom text style
  final TextStyle? _textStyle;

  /// User when you want to set global active and inactive color.
  SlidingClippedNavBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    required Color activeColor,
    Color? inactiveColor,
    this.iconSize = 30,
    this.textSize = 16,
    this.barHeight = 100,
    this.backgroundColor = Colors.white,
    BoxDecoration? barDecoration,
    TextStyle? textStyle,
  })  : assert(
            !barItems.any((element) =>
                (element.activeColor != null || element.inactiveColor != null)),
            '''You don\'t need to assign each item active & inactive color,
            when you already assigned global active color.'''),
        _activeColor = activeColor,
        _inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        _barDecoration = barDecoration,
        _textStyle = textStyle,
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4');

  /// User you want to set individual item active & inactive color.
  SlidingClippedNavBar.colorful({
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    this.iconSize = 30,
    this.textSize = 16,
    this.barHeight = 100,
    this.backgroundColor = Colors.white,
    BoxDecoration? barDecoration,
    TextStyle? textStyle,
  })  : assert(
            !barItems.any((element) =>
                (element.activeColor == null || element.inactiveColor == null)),
            'You need to assign each item active & inactive color'),
        _activeColor = null,
        _inactiveColor = null,
        _barDecoration = barDecoration,
        _textStyle = textStyle,
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4');

  @override
  Widget build(BuildContext context) {
    return BuildBar(
      buttons: barItems,
      iconSize: iconSize,
      textSize: textSize,
      barHeight: barHeight,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      backgroundColor: backgroundColor,
      barDecoration: _barDecoration,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
      textStyle: _textStyle,
    );
  }
}
