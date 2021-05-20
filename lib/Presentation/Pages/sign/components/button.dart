import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.size,
    @required this.onButtonPress,
    this.text,
    this.textcolor,
    this.buttoncolor,
  }) : super(key: key);

  final Size size;
  final String text;
  final MaterialColor textcolor;
  final MaterialColor buttoncolor;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: size.width * 0.8, height: 48),
      child: ElevatedButton(
        onPressed: this.onButtonPress,
        child: Text(
          text,
          style: AppFonts.button.copyWith(
            color: textcolor,
          ),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.cDarkGrey[500]),
          backgroundColor: MaterialStateProperty.all(buttoncolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }
}
