import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter/material.dart';

class ArabicImage extends StatelessWidget {
  final double bottom;
  final double top;
  final double left;
  final double right;
  final double size;
  final double opacity;
  final BlendMode blendMode;

  const ArabicImage({
    Key key,
    this.bottom,
    this.top,
    this.size,
    this.left,
    this.right,
    this.opacity = 0.5,
    this.blendMode = BlendMode.saturation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: this.left,
      bottom: this.bottom,
      top: this.top,
      right: this.right,
      child: BlendMask(
        opacity: this.opacity,
        blendMode: this.blendMode,
        child: Image(
          height: size,
          width: size,
          image: AssetImage('lib/Presentation/Images/ArabicCircle.png'),
        ),
      ),
    );
  }
}
