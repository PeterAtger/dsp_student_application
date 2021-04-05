import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/DotIndicators.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw1.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw2.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw3.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/lets_get_started.dart';
import 'package:flutter/material.dart';

class HIW extends StatefulWidget {
  /// Creates swipeable How it Works pages
  HIW();

  @override
  _HIWState createState() => _HIWState();
}

class _HIWState extends State<HIW> {
  final controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get size of phone

    // Three Pages of how it works
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
            print(pageIndex);
          },
          scrollDirection: Axis.horizontal,
          children: [
            HIW1(),
            HIW2(),
            HIW3(),
            GetStarted(),
          ],
        ),
        Positioned(
          bottom: 50,
          height: 24,
          child: DotIndicatiors(
            activeCircleIndex: pageIndex,
          ),
        ),
      ]),
    );
  }
}
