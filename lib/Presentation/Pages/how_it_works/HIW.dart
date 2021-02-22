import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/DotsAnimation.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw1.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw2.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/hiw3.dart';
import 'package:flutter/material.dart';

class HIW extends StatelessWidget {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            HIW1(),
            HIW2(),
            HIW3(),
          ],
        ),
        Positioned(
            left: size.width / 2 - 40,
            bottom: 50,
            width: 80,
            height: 24,
            child: DotsAnimation()),
        Positioned(
            bottom: 50,
            width: 200,
            height: 50,
            child: SwitchListTile(
              title: Text("Tata"),
              secondary: Icon(Icons.ac_unit),
              onChanged: (bool value) {},
              value: true,
            )),
      ]),
    );
  }
}
