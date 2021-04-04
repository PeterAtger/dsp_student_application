import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/GradientHeading.dart';
import 'package:dsp_student_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      ArabicImage(top: -150, size: size.height / 1.5, opacity: 0.05),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height / 5,
          ),
          GradientHeading(
            text: 'Let\'s get started',
          ),
          SizedBox(
            height: size.height / 5,
          ),
          Container(
            height: 80,
            width: 80,
            child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: SvgPicture.asset(
                  'lib/Presentation/Images/arrow.svg',
                  semanticsLabel: 'Arrow',
                )),
          )
        ],
      ),
    ]));
  }
}
