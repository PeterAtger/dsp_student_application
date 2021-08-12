import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TeacherTimeSettings extends StatelessWidget {
  const TeacherTimeSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '7:00 PM',
            style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
          ),
          Text(
            '8:00 PM',
            style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
          ),
        ],
      ),
    );
  }
}
