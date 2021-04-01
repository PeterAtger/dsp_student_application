import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter/material.dart';

class ArabicImage extends StatelessWidget {
  final double bottom;
  final double top;
  final double left;
  final double right;
  final double size;

  const ArabicImage({
    Key key,
    this.bottom,
    this.top,
    this.size,
    this.left,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -size / 2,
      bottom: this.bottom,
      top: this.top,
      child: BlendMask(
        opacity: 1,
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
