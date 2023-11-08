

import 'dart:math';

import 'package:flutter/material.dart';

class ChartWidget extends CustomPainter{
  ChartWidget({required this.value});
  final double value;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4;
     Offset center = Offset(size.width/2, size.height / 2);
     double radius = 25.0;
     canvas.drawCircle(center, radius, paint);
     final paintArc = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke
       ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;
     double angle = 2 * pi * (value/100);
     canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
         pi/2, angle, false, paintArc);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}