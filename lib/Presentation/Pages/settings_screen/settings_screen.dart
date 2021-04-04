import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -250,
            top: -170,
            child: Container(
              width: size.height / 1.5,
              height: size.height / 1.5,
              child: BlendMask(
                  blendMode: BlendMode.srcOver,
                  opacity: 0.05,
                  child:
                      Image.asset('lib/Presentation/Images/ArabicCircle.png')),
            ),
          ),
          Column(children: [
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
                    color: AppColors.cDarkGrey,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Settings',
                  style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(children: <Widget>[
              SizedBox(width: 32),
              Text(
                'App settings',
                style: AppFonts.heading3.copyWith(color: AppColors.cDarkGrey),
              ),
            ]),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/notification.svg',
                    semanticsLabel: 'notification',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Notifications',
                  style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/book.svg',
                    semanticsLabel: 'book',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Terms of use',
                  style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/how_it_works_question_mark.svg',
                    semanticsLabel: 'how_it_works_question_mark',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'How it works',
                  style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/profile.svg',
                    semanticsLabel: 'profile',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Log out',
                  style: AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                height: 1,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.cGreen, AppColors.cPurple]),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(children: <Widget>[
              SizedBox(width: 32),
              Text(
                'Contact Us',
                style: AppFonts.heading3.copyWith(color: AppColors.cDarkGrey),
              ),
            ]),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/phone.svg',
                    semanticsLabel: 'phone',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '+202 991 991 991',
                  style: AppFonts.smallButtonText
                      .copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/internet.svg',
                    semanticsLabel: 'internet',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'www.rdi-eg.ai',
                  style: AppFonts.smallButtonText
                      .copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/email2.svg',
                    semanticsLabel: 'Email',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'info@rdi-eg.ai',
                  style: AppFonts.smallButtonText
                      .copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 32),
                Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'lib/Presentation/Images/location.svg',
                    semanticsLabel: 'location',
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '3, Haroon st., Giza, Egypt',
                  style: AppFonts.smallButtonText
                      .copyWith(color: AppColors.cDarkGrey),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
