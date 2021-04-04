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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
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
              SizedBox(height: 32),
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
            ],
          ),
          Positioned(
            top: size.height / 3,
            child: Container(
              height: size.height * 2 / 3,
              width: size.width,
              decoration: BoxDecoration(color: AppColors.cWhite),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
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
                      Text('Grade :  ',
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
                          child: QuestionButton(
                              size: size,
                              text: 'Answered Questions: 3',
                              green: false))
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuestionButton(
                          size: size, text: 'Waiting Questions: 3', green: true)
                    ],
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

class QuestionButton extends StatelessWidget {
  const QuestionButton(
      {Key key, @required this.size, @required this.text, @required this.green})
      : super(key: key);

  final Size size;
  final String text;
  final bool green;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width * 0.8,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(AppColors.cDarkGrey[50]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStateProperty.all(
                green ? AppColors.cGreen : AppColors.cLightGrey)),
        onPressed: () {},
        child: Center(
          child: Text(
            this.text,
            style: AppFonts.buttonText
                .copyWith(color: green ? AppColors.cWhite : AppColors.cGreen),
          ),
        ),
      ),
    );
  }
}
