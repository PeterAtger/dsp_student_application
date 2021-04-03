import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/ArabicImage.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/BackGroundGradient.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/elements/InputField.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/elements/button.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/elements/buttonicon.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/elements/dividingline.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGroundGradient(),
          ArabicImage(
              top: -150,
              bottom: null,
              left: -200,
              size: size.height / 1.5,
              opacity: 1),
          ArabicImage(
              bottom: -150,
              top: null,
              left: -200,
              size: size.height / 1.5,
              opacity: 1),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  //logo
                  ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: size.width * 0.8,
                child: inputfield(size, AppColors.cWhite, AppColors.cWhite,
                    AppColors.cWhite, 'Email', 'email', true),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.8,
                child: inputfield(size, AppColors.cWhite, AppColors.cWhite,
                    AppColors.cWhite, 'Password', 'key', true,
                    isPass: true),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: size.width * 0.8,
                child: Button(
                  size: size,
                  text: 'Login',
                  textcolor: AppColors.cGreen,
                  buttoncolor: AppColors.cWhite,
                  // destination: , //main screen
                ),
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
                  destination: SignUp(),
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
                  color: AppColors.cWhite,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonIcon(
                      size: size,
                      text: 'Facebook',
                      icon: 'facebook',
                      iconcolor: Colors.blue,
                      textcolor: Colors.blue,
                      buttoncolor: AppColors.cWhite,
                      frame: AppColors.cWhite,
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    ButtonIcon(
                      size: size,
                      text: 'Google',
                      icon: 'googlee',
                      iconcolor: Colors.red,
                      textcolor: AppColors.cDarkGrey,
                      buttoncolor: AppColors.cWhite,
                      frame: AppColors.cWhite,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
