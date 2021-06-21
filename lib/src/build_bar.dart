import 'package:flutter/material.dart';

import 'animated_button.dart';
import 'menu_item.dart';

typedef OnButtonPressCallback = void Function(int index);

class BuildBar extends StatelessWidget {
  final List<BarItem> buttons;

  final int selectedIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;

  final OnButtonPressCallback onButtonPress;
  final Color backgroundColor;

  const BuildBar({
    Key? key,
    required this.buttons,
    required this.selectedIndex,
    required this.iconSize,
    required this.activeColor,
    required this.inactiveColor,
    required this.onButtonPress,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons.map(
          (item) {
            return AnimatedButton(
              icon: item.icon,
              size: iconSize,
              title: item.title,
              activeColor: activeColor,
              index: buttons.indexOf(item),
              isSelected: buttons.indexOf(item) == selectedIndex ? true : false,
              onTap: onButtonPress,
              slidingCardColor: backgroundColor,
              inactiveColor: inactiveColor,
            );
          },
        ).toList(),
      ),
    );
  }
}
