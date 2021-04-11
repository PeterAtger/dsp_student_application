import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_student_application/Presentation/Global_components/NavBar.dart';
import 'package:dsp_student_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/SettingsToggle.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: DiffNavBar(),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned(
            right: -size.height / 3,
            top: -size.height / 3,
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
              SizedBox(height: 72),
              TitleBar(title: 'Notifications'),
              SizedBox(height: 56),
              SettingsToggle(
                size: size,
                spacing: 32,
                toggleText: 'Push Notifications',
              ),
              SizedBox(height: 32),
              GradientLine(size: size),
              SizedBox(height: 8),
              SettingsToggle(
                size: size,
                toggleText: 'Answered Query',
                spacing: 80,
              ),
              SizedBox(height: 8),
              SettingsToggle(
                size: size,
                toggleText: 'New Updates',
                spacing: 80,
              )
            ],
          ),
        ],
      ),
    );
  }
}
