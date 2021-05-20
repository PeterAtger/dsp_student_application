import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  final bool isGreen;

  const AnswerWidget({Key key, this.answer, this.isGreen = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 4,
                  blurRadius: 4,
                  color: AppColors.cLightGrey,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          children: [
            Container(
              height: 2,
              width: 8,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                color: AppColors.cPurple[700],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Text(
                  this.answer,
                  style: AppFonts.bodyText1,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
