import 'package:flutter/material.dart';

class SlicedCard extends CustomPainter {
  final Color _color;
  final double _heightPercent;

  SlicedCard(this._color, this._heightPercent);
  static Widget draw({
    required Color cardColor,
    required double heightFraction,
  }) =>
      CustomPaint(
        painter: SlicedCard(
          cardColor,
          heightFraction,
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.lineTo(size.width, size.height * _heightPercent);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
