import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key key,
    @required this.size,
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
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: size.width * 0.35, height: 50),
      child: ElevatedButton.icon(
        onPressed: () {
          // Respond to button press
        },
        icon: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
          child: Container(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              'lib/Presentation/Images/$icon.svg',
            ),
          ),
        ),
        label: Text(
          text,
          style: AppFonts.smallButtonText.copyWith(
            color: textcolor,
          ),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(buttoncolor),
          backgroundColor: MaterialStateProperty.all(buttoncolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
                side: BorderSide(width: 1, color: frame)),
          ),
        ),
      ),
    );
  }
}
