import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height / 3,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.cGreen, AppColors.cPurple]),
            ),
          ),
          Positioned(
            right: -250,
            top: -200,
            child: Container(
              width: size.height / 1.5,
              height: size.height / 1.5,
              child: BlendMask(
                  blendMode: BlendMode.srcOver,
                  opacity: 0.1,
                  child:
                      Image.asset('lib/Presentation/Images/ArabicCircle.png')),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      'lib/Presentation/Images/arrow.svg',
                      semanticsLabel: 'Arrow',
                      color: AppColors.cWhite,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Profile',
                    style: AppFonts.heading2.copyWith(color: AppColors.cWhite),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColors.cWhite,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Peter Atef',
                  style: AppFonts.heading2.copyWith(color: AppColors.cWhite),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: 32,
                  ),
                  Text('Email : ',
                      style: AppFonts.appText.copyWith(
                        color: AppColors.cGreen,
                      )),
                  Text('Peter.Atef@example.com',
                      style: AppFonts.appText
                          .copyWith(color: AppColors.cDarkGrey)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 32,
                  ),
                  Text('Grade : ',
                      style: AppFonts.appText.copyWith(
                        color: AppColors.cGreen,
                      )),
                  Text('Secondary',
                      style: AppFonts.appText
                          .copyWith(color: AppColors.cDarkGrey)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 32,
                  ),
                  Text('User Since : ',
                      style: AppFonts.appText.copyWith(
                        color: AppColors.cGreen,
                      )),
                  Text('1+ years',
                      style: AppFonts.appText
                          .copyWith(color: AppColors.cDarkGrey)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: size.width - 20,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppColors.cGreen, AppColors.cPurple])),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FlatButton(
                        height: 50,
                        minWidth: size.width - 20,
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Answered Questions',
                            style: AppFonts.buttonText
                                .copyWith(color: AppColors.cGreen),
                          ),
                        ),
                        color: AppColors.cLightGrey),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FlatButton(
                        height: 50,
                        minWidth: size.width - 20,
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Waiting Questions',
                            style: AppFonts.buttonText
                                .copyWith(color: AppColors.cWhite),
                          ),
                        ),
                        color: AppColors.cGreen),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
