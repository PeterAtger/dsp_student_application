import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: "Fearch",
            child: Container(
              width: size.width,
              height: 52,
              color: AppColors.cGreen,
            ),
          )
        ],
      ),
    );
  }
}
