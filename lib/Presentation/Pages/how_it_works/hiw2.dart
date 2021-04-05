import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/BackGroundGradient.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/GradientHeading.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/material.dart';

class HIW2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      BackGroundGradient(),
      ArabicImage(top: -150, left: size.height / 6, size: size.height / 1.5),
      ArabicImage(
          bottom: -150, right: size.height / 6, size: size.height / 1.5),

      // White Circle
      Positioned(
          top: -size.height * 0.85,
          right: -size.width * 0.4,
          child: Container(
            height: size.height * 2,
            width: size.width * 1.5,
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              shape: BoxShape.circle,
            ),
          )),

      // Gradient Title
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height / 5,
          ),
          GradientHeading(
            text: 'How it works',
          )
        ],
      ),
    ]));
  }
}
