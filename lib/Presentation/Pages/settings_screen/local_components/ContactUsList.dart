import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsList extends StatelessWidget {
  final String iconName;
  final String contactText;
  const ContactUsList({
    Key key,
    this.iconName,
    this.contactText,
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
            'lib/Presentation/Images/${this.iconName}.svg',
            semanticsLabel: this.iconName,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          this.contactText,
          style: AppFonts.smallButtonText.copyWith(color: AppColors.cDarkGrey),
        ),
      ],
    );
  }
}
