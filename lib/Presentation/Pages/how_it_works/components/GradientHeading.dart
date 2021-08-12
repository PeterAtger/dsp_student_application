import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class GradientHeading extends StatelessWidget {
  final String text;
  const GradientHeading({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.cGreen, AppColors.cPurple]).createShader(bounds),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppFonts.heading3.copyWith(
            color: AppColors.cWhite,
          ),
        ));
  }
}
