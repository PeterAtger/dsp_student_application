import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TopCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.cGreen, AppColors.cPurple])
        .createShader(Rect.fromCircle(
      center: Offset(size.width / 4, size.width / 4),
      radius: size.width / 2,
    ));

    path = Path();
    path.lineTo(0, size.height * 0.45);
    path.cubicTo(size.width * 0.11, size.height * 0.56, size.width * 0.29,
        size.height * 0.67, size.width * 0.56, size.height * 0.74);
    path.cubicTo(size.width * 0.76, size.height * 0.79, size.width * 0.9,
        size.height * 0.89, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.45, 0, size.height * 0.45);
    path.cubicTo(
        0, size.height * 0.45, 0, size.height * 0.45, 0, size.height * 0.45);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TopCurvePainterRev extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = AppColors.cWhite;

    path = Path();
    path.lineTo(0, size.height * 0.45);
    path.cubicTo(size.width * 0.11, size.height * 0.56, size.width * 0.29,
        size.height * 0.67, size.width * 0.56, size.height * 0.74);
    path.cubicTo(size.width * 0.76, size.height * 0.79, size.width * 0.9,
        size.height * 0.89, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width * 0.32, size.height,
        size.width * 0.32, size.height);
    path.cubicTo(
        size.width * 0.32, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.45, 0, size.height * 0.45);
    path.cubicTo(
        0, size.height * 0.45, 0, size.height * 0.45, 0, size.height * 0.45);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
