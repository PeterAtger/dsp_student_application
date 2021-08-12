import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({
    Key key,
    @required this.size,
    @required this.instructionText,
    @required this.instructionImage,
  }) : super(key: key);

  final Size size;
  final String instructionText;
  final String instructionImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 72),
        height: size.height / 2,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: size.width * 0.8,
              image: AssetImage(
                  'lib/Presentation/Images/${this.instructionImage}.png'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: Text(
                this.instructionText,
                textAlign: TextAlign.center,
                style: AppFonts.bodyText1.copyWith(
                  color: AppColors.cWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
