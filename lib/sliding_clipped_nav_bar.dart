library sliding_clipped_nav_bar;

import 'package:flutter/material.dart';
export 'src/model/menu_item.dart';
import 'src/model/menu_item.dart';
import 'src/nav_bar_body.dart';

class SlidingClippedNavBar extends StatelessWidget {
  /// List of bar items shown horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  /// Selected index of the bar items.
  final int selectedIndex;

  /// Size of all icons (inactive items), don't make it too big or will be clipped.
  final double iconSize;

  /// FontSize of the text.
  final double? fontSize;

  /// FontWeight of the text.
  final FontWeight? fontWeight;

  /// FontStyle of the text.
  final FontStyle? fontStyle;

  /// Color of the selected item which indicate selected.
  final Color? _activeColor;

  /// Inactive color of item, which actually color icons.
  final Color? _inactiveColor;

  /// Callback when item is pressed.
  final OnButtonPressCallback onButtonPressed;

  /// background color of the bar.
  final Color backgroundColor;

  /// User when you want to set global active and inactive color.
  SlidingClippedNavBar({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    required Color activeColor,
    Color? inactiveColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : assert(
            !barItems.any((BarItem element) =>
                (element.activeColor != null || element.inactiveColor != null)),
            '''You don't need to assign each item active & inactive color,
            when you already assigned global active color.'''),
        _activeColor = activeColor,
        _inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4'),
        super(key: key);

  /// User you want to set individual item active & inactive color.
  SlidingClippedNavBar.colorful({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : assert(
            !barItems.any((BarItem element) =>
                (element.activeColor == null || element.inactiveColor == null)),
            'You need to assign each item active & inactive color'),
        _activeColor = null,
        _inactiveColor = null,
        assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        assert(barItems.length < 5, 'Maximum menu item count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarBody(
      buttons: barItems,
      iconSize: iconSize,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      backgroundColor: backgroundColor,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
