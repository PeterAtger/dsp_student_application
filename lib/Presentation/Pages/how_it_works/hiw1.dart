import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/GradientHeading.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

import 'components/ArabicImage.dart';
import 'components/BackGroundGradient.dart';

class HIW1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isPortrait = size.height > size.width;

    return Scaffold(
        body: Stack(children: <Widget>[
      BackGroundGradient(),
      ArabicImage(top: -150, bottom: null, size: size.height / 1.5),
      ArabicImage(bottom: -150, top: null, size: size.height / 1.5),
      Positioned(
          top: -size.height * 0.85,
          left: -size.width * 0.4,
          child: Container(
            height: size.height * 2,
            width: size.width * 1.5,
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              shape: BoxShape.circle,
            ),
          )),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height / 5,
          ),
          GradientHeading(
            text: 'How it works',
          ),
        ],
      ),
    ]));
  }
}
