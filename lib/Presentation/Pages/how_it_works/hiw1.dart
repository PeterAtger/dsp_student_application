import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class HIW1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      BackGroundGradient(),
      ArabicImage(
        top: -150,
        bottom: null,
      ),
      ArabicImage(
        bottom: -150,
        top: null,
      ),
      // Container(
      //   child: Image(
      //     image: AssetImage('lib/Presentation/Images/ArabicCircle.png'),
      //     colorBlendMode: BlendMode.lighten,
      //   ),
      // )
    ]));
  }
}

class BackGroundGradient extends StatelessWidget {
  const BackGroundGradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.1, 1],
              colors: [AppColors.cPurple, AppColors.cGreen])),
    );
  }
}

class ArabicImage extends StatelessWidget {
  final double bottom;
  final double top;

  const ArabicImage({
    Key key,
    this.bottom,
    this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -250,
      bottom: this.bottom,
      top: this.top,
      child: BlendMask(
        opacity: 0.8,
        blendMode: BlendMode.saturation,
        child: Image(
          height: 600,
          width: 600,
          image: AssetImage('lib/Presentation/Images/ArabicCircle.png'),
        ),
      ),
    );
  }
}
