import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class FromToPanda extends StatelessWidget {
  const FromToPanda({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'From',
            style: AppFonts.appText.copyWith(color: AppColors.cGreen),
          ),
          Text(
            'To',
            style: AppFonts.appText.copyWith(color: AppColors.cGreen),
          ),
        ],
      ),
    );
  }
}
