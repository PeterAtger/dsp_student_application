import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveHours extends StatelessWidget {
  const ActiveHours({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 48),
        Text(
          'Active Hours',
          style: AppFonts.heading3.copyWith(color: AppColors.cDarkGrey),
        ),
        SizedBox(width: 70),
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            'lib/Presentation/Images/panda.svg',
            semanticsLabel: 'panda',
          ),
        ),
      ],
    );
  }
}
