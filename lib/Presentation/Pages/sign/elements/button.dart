import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.size,
    this.text,
    this.textcolor,
    this.buttoncolor,
    this.destination,
  }) : super(key: key);

  final Size size;
  final String text;
  final MaterialColor textcolor;
  final MaterialColor buttoncolor;
  final Widget destination;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: size.width * 0.8, height: 50),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          text,
          style: AppFonts.buttonText.copyWith(
            color: textcolor,
          ),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(buttoncolor),
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
