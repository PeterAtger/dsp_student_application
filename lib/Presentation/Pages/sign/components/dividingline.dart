import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class DividingLine extends StatelessWidget {
  const DividingLine({
    Key key,
    @required this.size,
    this.text,
    this.color,
  }) : super(key: key);

  final Size size;
  final String text;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: size.width * 0.23,
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [0, 0.7],
                colors: [color, Colors.transparent],
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppFonts.captionText.copyWith(color: color),
          ),
        ),
        Expanded(
          child: Container(
            width: size.width * 0.23,
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0, 0.7],
                colors: [color, Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
