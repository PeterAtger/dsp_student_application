import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class DotIndicatiors extends StatelessWidget {
  final index;

  /// Creates a 3 dot indicator
  ///
  /// Takes Index as an argument to know which dot should be active
  DotIndicatiors({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: this.index == 0 ? 24 : 12,
          height: this.index == 0 ? 24 : 12,
          decoration: BoxDecoration(
              color: this.index == 0 ? AppColors.cGreen : AppColors.cLightGrey,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: this.index == 1 ? 24 : 12,
          height: this.index == 1 ? 24 : 12,
          decoration: BoxDecoration(
              color: this.index == 1 ? AppColors.cGreen : AppColors.cLightGrey,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: this.index == 2 ? 24 : 12,
          height: this.index == 2 ? 24 : 12,
          decoration: BoxDecoration(
              color: this.index == 2 ? AppColors.cGreen : AppColors.cLightGrey,
              shape: BoxShape.circle),
        ),
      ],
    ));
  }
}
