import 'package:dsp_student_application/Presentation/Pages/sign/top_curve.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  /// Creates swipeable How it Works pages
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _gradeList = [
    ['Grade', 'lib/Presentation/Images/grade.svg'],
    ['Primary', 'lib/Presentation/Images/boy.svg'],
    ['Preparatory', 'lib/Presentation/Images/girl.svg'],
    ['Secondary', 'lib/Presentation/Images/secondaryboy.svg']
  ];
  String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = _gradeList[0][0];
  }

  @override
  Widget build(BuildContext context) {
    // Get size of phone
    final Size size = MediaQuery.of(context).size;

    // Returns Three Pages of how it works
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TopCurvePainter(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          ArabicImage(top: -150, bottom: null, size: size.height / 1.5),
          CustomPaint(
            painter: TopCurvePainterRev(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height / 2,
                  ),
                  Center(
                    child: Container(
                      width: size.width * 0.8,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.cDarkGrey)),
                          ),
                          value: _selectedItem,
                          dropdownColor: AppColors.cWhite,
                          elevation: 0,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value.toString();
                              print(_selectedItem);
                            });
                          },
                          items: _gradeList
                              .map((v) => DropdownMenuItem(
                                  value: v[0],
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 24,
                                          width: 24,
                                          child: SvgPicture.asset(v[1])),
                                      SizedBox(width: 12),
                                      Text(v[0],
                                          style:
                                              AppFonts.smallButtonText.copyWith(
                                            color: AppColors.cDarkGrey,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ],
                                  )))
                              .toList()),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
