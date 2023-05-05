import 'package:flutter/material.dart';

class BottomNavigationCustomBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    final Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.35, 0, size.width * 0.4, size.height * 0.15);
    path.cubicTo(size.width * 0.38, size.height * 0.95, size.width * 0.6,
        size.height * 0.95, size.width * 0.6, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.63, 0, size.width, size.height * 0.65);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.grey, 50.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
