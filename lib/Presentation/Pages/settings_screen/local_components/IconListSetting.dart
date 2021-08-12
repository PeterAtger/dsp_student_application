import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconListSetting extends StatelessWidget {
  final String iconName;
  final String settingText;
  final Function onTab;
  const IconListSetting({
    Key key,
    this.iconName,
    this.settingText,
    @required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
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
            SizedBox(width: 8),
            Text(
              this.settingText,
              style: AppFonts.bodyText1.copyWith(color: AppColors.cDarkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
