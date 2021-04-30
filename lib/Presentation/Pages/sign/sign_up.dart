import 'package:dsp_student_application/Presentation/Pages/sign/components/InputField.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/button.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/buttonicon.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/dividingline.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/top_curve.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _gradeList = [
    ['Grade', 'lib/Presentation/Images/greade.svg'],
    ['Primary', 'lib/Presentation/Images/boysvg.svg'],
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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.cWhite,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            painter: TopCurvePainter(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          ArabicImage(
              top: -150,
              left: -size.height / 5,
              size: size.height / 1.5,
              opacity: 0.5),
          CustomPaint(
            painter: TopCurvePainterRev(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          Container(
            child: Positioned(
              top: size.height * 0.13,
              child: Text(
                'Sign Up',
                style: AppFonts.heading1.copyWith(color: AppColors.cWhite),
              ),
            ),
          ),
          Container(
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 72),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: size.width * 0.8,
                      child: inputfield(
                          size,
                          AppColors.cLightGrey,
                          AppColors.cDarkGrey,
                          AppColors.cDarkGrey,
                          'Full Name',
                          'name',
                          false)),
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                        size,
                        AppColors.cLightGrey,
                        AppColors.cDarkGrey,
                        AppColors.cGreen,
                        'Email',
                        'email',
                        true),
                  ),
                  SizedBox(
                    height: 4, //bad value
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                        size,
                        AppColors.cLightGrey,
                        AppColors.cDarkGrey,
                        AppColors.cGreen,
                        'Password',
                        'key',
                        true,
                        isPass: true),
                  ),
                  SizedBox(
                    height: 4, //bad value
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 24, bottom: 12, left: 12, right: 12),
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.cLightGrey)),
                        ),
                        value: _selectedItem,
                        dropdownColor: AppColors.cWhite,
                        elevation: 2,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value.toString();
                          });
                        },
                        items: _gradeList
                            .map((item) => DropdownMenuItem(
                                value: item[0],
                                child: Row(
                                  children: [
                                    Container(
                                        height: 24,
                                        width: 24,
                                        child: SvgPicture.asset(item[1])),
                                    SizedBox(width: 12),
                                    Text(item[0],
                                        style: AppFonts.appText.copyWith(
                                          color: AppColors.cDarkGrey,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ],
                                )))
                            .toList()),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: Button(
                      size: size,
                      text: 'Sign Up',
                      textcolor: AppColors.cWhite,
                      buttoncolor: AppColors.cGreen,
                      onButtonPress: () async {
                        await Future.delayed(Duration(milliseconds: 250), () {
                          Navigator.of(context).pushReplacementNamed('/HIW');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: DividingLine(
                      size: size,
                      text: 'Or Login With',
                      color: AppColors.cDarkGrey,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 48,
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ButtonIcon(
                            size: size,
                            text: 'Facebook',
                            icon: 'facebook',
                            iconcolor: Colors.blue,
                            textcolor: Colors.blue,
                            buttoncolor: AppColors.cWhite,
                            frame: AppColors.cWhite,
                            onButtonPress: () {},
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 1,
                          child: ButtonIcon(
                            size: size,
                            text: 'Google',
                            icon: 'googlee',
                            iconcolor: Colors.red,
                            textcolor: AppColors.cDarkGrey,
                            buttoncolor: AppColors.cWhite,
                            onButtonPress: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpGradient extends StatelessWidget {
  const SignUpGradient({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.49,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0, 1],
            colors: [AppColors.cPurple, AppColors.cGreen]),
      ),
    );
  }
}
