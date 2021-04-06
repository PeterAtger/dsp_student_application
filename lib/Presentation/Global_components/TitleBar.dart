import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool isTitleColorWhite;
  const TitleBar({
    Key key,
    this.title = '',
    this.isTitleColorWhite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 32),
        Container(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            'lib/Presentation/Images/arrow.svg',
            semanticsLabel: 'Arrow',
            color: isTitleColorWhite ? AppColors.cWhite : AppColors.cDarkGrey,
          ),
        ),
        SizedBox(width: 8),
        Text(
          this.title,
          style: AppFonts.heading2.copyWith(
              color:
                  isTitleColorWhite ? AppColors.cWhite : AppColors.cDarkGrey),
        ),
      ],
    );
  }
}
