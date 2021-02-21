import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class HIW1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isPortrait = size.height > size.width ? true : false;

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
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          )),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height / 5,
          ),
          Text(
            'How it Works',
            textAlign: TextAlign.center,
            style: AppFonts.heading1,
          )
        ],
      )
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
              stops: [0, 1],
              colors: [AppColors.cPurple, AppColors.cGreen])),
    );
  }
}

class ArabicImage extends StatelessWidget {
  final double bottom;
  final double top;
  final double size;

  const ArabicImage({
    Key key,
    this.bottom,
    this.top,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -size / 2,
      bottom: this.bottom,
      top: this.top,
      child: BlendMask(
        opacity: 0.5,
        blendMode: BlendMode.saturation,
        child: Image(
          height: size,
          width: size,
          image: AssetImage('lib/Presentation/Images/ArabicCircle.png'),
        ),
      ),
    );
  }
}
