import 'package:flutter/material.dart';

class RippleEffect extends CustomPainter {
  final Color _color;
  final double _strokeWidth;

  RippleEffect(
    this._color,
    this._strokeWidth,
  );
  static Widget draw({
    required Color rippleColor,
    required double size,
    required double strokeWidth,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: RippleEffect(
            rippleColor,
            strokeWidth,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
