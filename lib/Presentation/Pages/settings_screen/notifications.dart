import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
          Column(
            children: [
              SizedBox(height: 64),
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
                  SizedBox(width: 10.0),
                  Text(
                    'Notifications',
                    style:
                        AppFonts.heading2.copyWith(color: AppColors.cDarkGrey),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 32),
                  Container(
                    width: size.width - 32,
                    height: 50,
                    child: SwitchListTile(
                      title: Text(
                        'Push Notifications',
                        style: AppFonts.heading3
                            .copyWith(color: AppColors.cDarkGrey),
                      ),
                      value: true,
                      onChanged: (bool value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 1,
                  width: size.width - 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppColors.cGreen, AppColors.cPurple]),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: size.width - 80,
                height: 50,
                child: SwitchListTile(
                  title: Text(
                    'Answered Query',
                    style:
                        AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                  ),
                  value: true,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(width: 32, height: 10),
              Container(
                width: size.width - 80,
                height: 50,
                child: SwitchListTile(
                  title: Text(
                    'New Updates',
                    style:
                        AppFonts.appText.copyWith(color: AppColors.cDarkGrey),
                  ),
                  value: true,
                  onChanged: (bool value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
