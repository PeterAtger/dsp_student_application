import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key key,
    @required this.size,
    @required this.onButtonPress,
    this.text,
    this.icon,
    this.iconcolor,
    this.textcolor,
    this.buttoncolor,
    this.frame,
  }) : super(key: key);

  final Size size;
  final String text;
  final String icon;
  final MaterialColor iconcolor;
  final MaterialColor textcolor;
  final MaterialColor buttoncolor;
  final MaterialColor frame;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPress,
      child: Row(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 16),
          child: Container(
            width: 16,
            height: 16,
            child: SvgPicture.asset(
              'lib/Presentation/Images/$icon.svg',
            ),
          ),
        ),
        Expanded(
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            maxFontSize: 15,
            minFontSize: 1,
            style: AppFonts.button.copyWith(
              color: textcolor,
            ),
          ),
        ),
      ]),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(AppColors.cDarkGrey[500]),
        backgroundColor: MaterialStateProperty.all(buttoncolor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
