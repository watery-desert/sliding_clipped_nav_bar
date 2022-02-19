import 'package:flutter/material.dart';
import '../nav_bar_body.dart';
import '../paint/ripple_effect.dart';
import '../paint/sliced_card.dart';

class NavBarButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final double size;
  final int index;
  final Color slidingCardColor;
  final Color inactiveColor;
  final int itemCount;

  final OnButtonPressCallback onTap;
  const NavBarButton({
    Key? key,
    required this.icon,
    required this.size,
    required this.title,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
    required this.index,
    required this.slidingCardColor,
    required this.inactiveColor,
    required this.itemCount,
  }) : super(key: key);

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    if (widget.isSelected) {
      _animationController.forward(from: 0.3);
    }
  }

  Widget _buildCard(double height, [Color? color]) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      // width: 70,
      width: deviceWidth / widget.itemCount,
      height: height,
      child: SlicedCard.draw(
          cardColor: color ?? widget.slidingCardColor,
          heightFraction: Tween<double>(begin: 0.1, end: 0.4)
              .animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.5,
                    0.7,
                  ),
                ),
              )
              .value),
    );
  }

  @override
  void didUpdateWidget(NavBarButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected && widget.isSelected) {
      _animationController.forward();
    }
    if (oldWidget.isSelected != widget.isSelected && !widget.isSelected) {
      _animationController.reverse();
    }
  }

  TextStyle getTextStyle() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: widget.activeColor,
      );

  // copied from here
  //https://stackoverflow.com/a/62536187/16122873
  double textHeight(String text, TextStyle textStyle) => (TextPainter(
          text: TextSpan(text: text, style: textStyle),
          maxLines: 1,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          textDirection: Directionality.of(context))
        ..layout())
      .size
      .height;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final Color activeColor = widget.activeColor;
    final double size = widget.size;
    final int index = widget.index;
    final Function(int) onTap = widget.onTap;
    final String title = widget.title;
    final Color inactiveColor = widget.inactiveColor;
    final Color slidingCardColor = widget.slidingCardColor;
    final double eachIconWidth = deviceWidth / widget.itemCount;

    return GestureDetector(
      onTap: () {
        onTap(index);
        if (_animationController.status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: slidingCardColor,
              width: eachIconWidth,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(
                  0,
                  -1.4,
                ),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: Icon(
                widget.icon,
                size: size,
                color: inactiveColor,
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(
                  0,
                  0.8,
                ),
                end: const Offset(
                  0,
                  -0.7,
                ),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: _buildCard(60),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(
                  0,
                  1.4,
                ),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(
                    0.3,
                    1.0,
                  ),
                ),
              ),
              child: Container(
                width: deviceWidth / widget.itemCount,
                alignment: Alignment.center,
                height: textHeight(title, getTextStyle()),
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: getTextStyle().merge(DefaultTextStyle.of(context).style),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(
                0,
                42,
              ),
              child: _buildCard(56.0),
            ),
            Transform.translate(
              offset: const Offset(
                0,
                25,
              ),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: const Interval(
                      0.3,
                      1.0,
                    ),
                  ),
                ),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: widget.isSelected && _animationController.value <= 0.3,
              child: RippleEffect.draw(
                size: Tween<double>(begin: 8.0, end: 56.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.0,
                          0.3,
                        ),
                      ),
                    )
                    .value,
                strokeWidth: Tween<double>(begin: 24.0, end: 0.0)
                    .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(
                          0.1,
                          0.3,
                        ),
                      ),
                    )
                    .value,
                rippleColor: activeColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
