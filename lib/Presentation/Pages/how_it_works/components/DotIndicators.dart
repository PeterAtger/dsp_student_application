import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class DotIndicatiors extends StatelessWidget {
  final activeCircleIndex;

  /// Creates a 3 dot indicator
  ///
  /// Takes Index as an argument to know which dot should be active
  DotIndicatiors({
    this.activeCircleIndex,
  });

  double circleSize(containerIndex) {
    return this.activeCircleIndex == containerIndex ? 24 : 12;
  }

  circleColor(containerIndex) {
    return this.activeCircleIndex == containerIndex
        ? AppColors.cGreen
        : AppColors.cLightGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: circleSize(0),
          height: circleSize(0),
          decoration:
              BoxDecoration(color: circleColor(0), shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: circleSize(1),
          height: circleSize(1),
          decoration:
              BoxDecoration(color: circleColor(1), shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: circleSize(2),
          height: circleSize(2),
          decoration:
              BoxDecoration(color: circleColor(2), shape: BoxShape.circle),
        ),
      ],
    ));
  }
}
