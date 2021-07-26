import 'package:flutter/material.dart';

import 'animated_button.dart';
import 'menu_item.dart';

typedef OnButtonPressCallback = void Function(int index);

class BuildBar extends StatelessWidget {
  final List<BarItem> buttons;
  final int selectedIndex;
  final double iconSize;
  final double textSize;
  final Color? activeColor;
  final Color? inactiveColor;
  final OnButtonPressCallback onButtonPress;
  final Color backgroundColor;
  final BoxDecoration? barDecoration;
  final TextStyle? textStyle;
  final double barHeight;

  const BuildBar({
    Key? key,
    required this.buttons,
    required this.selectedIndex,
    required this.iconSize,
    required this.textSize,
    required this.barHeight,
    required this.activeColor,
    required this.inactiveColor,
    required this.onButtonPress,
    required this.backgroundColor,
    required this.barDecoration,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: barHeight,
      decoration: barDecoration ?? BoxDecoration(
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttons.map(
          (item) {
            final buttonIndex = buttons.indexOf(item);
            return AnimatedButton(
              icon: item.icon,
              iconSize: iconSize,
              textSize: textSize,
              buttonHeight: barHeight * 0.56,
              title: item.title,
              activeColor: item.activeColor ?? activeColor!,
              inactiveColor: item.inactiveColor ?? inactiveColor!,
              index: buttonIndex,
              isSelected: buttonIndex == selectedIndex ? true : false,
              onTap: onButtonPress,
              slidingCardColor: backgroundColor,
              itemCount: buttons.length,
              textStyle: textStyle,
            );
          },
        ).toList(),
      ),
    );
  }
}
