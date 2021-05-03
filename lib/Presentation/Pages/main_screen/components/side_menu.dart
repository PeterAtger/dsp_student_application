import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/global_components/GradientLine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

final Shader linearGradient = LinearGradient(
  colors: <Color>[AppColors.cPurple, AppColors.cGreen],
).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 100.0));

class SideMenu extends StatelessWidget {
  final Size size;

  const SideMenu({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // give it The desired border radius
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(56),
        topRight: Radius.circular(56),
      ),
      // wrap with a sizedbox for a custom width [for more flexibility]
      child: SizedBox(
        width: size.width / 1.2,
        child: Drawer(
          child: SidMenuBar(
            size: size,
          ),
        ),
      ),
    );
  }
}

class SidMenuBar extends StatelessWidget {
  final Size size;

  const SidMenuBar({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(bottom: 72),
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                // Top Spacing
                SizedBox(
                  height: 72,
                ),

                // Menu bar
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 32,
                            color: AppColors.cDarkGrey,
                          ),
                          onPressed: () => Navigator.of(context).pop()),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Menu",
                        style: AppFonts.heading2.copyWith(
                          color: AppColors.cDarkGrey,
                        ))
                  ],
                ),

                // Username
                SizedBox(height: 32),
                Row(children: [
                  SizedBox(
                    width: 24,
                  ),
                  Icon(
                    Icons.supervised_user_circle,
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    " Sara Magdy",
                    style:
                        AppFonts.heading3.copyWith(color: AppColors.cDarkGrey),
                  ),
                ]),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: GradientLine(
                    size: size,
                  ),
                ),

                Column(children: [
                  SettingTab(
                    text: 'Profile',
                    onTab: () {
                      context.read<NavbarCubit>().goToProfile();
                      Navigator.of(context).pop();
                    },
                  ),
                  SettingTab(
                    text: 'Help',
                    onTab: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SettingTab(
                    text: 'Settings',
                    onTab: () {
                      context.read<NavbarCubit>().goToSettings();
                      Navigator.of(context).pop();
                    },
                  ),
                  SettingTab(
                    text: 'LogOut',
                    onTab: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: GradientLine(
                    size: size,
                  ),
                ),
              ],
            ),
            Text(
              "APP VERSION 0.0.2 Alpha  ",
              textAlign: TextAlign.center, //style:AppFonts.versionControl,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            )
          ],
        ),
      ),
    );
  }
}

class SettingTab extends StatelessWidget {
  final String text;
  final Function onTab;
  const SettingTab({
    Key key,
    @required this.text,
    @required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future.delayed(Duration(milliseconds: 250), this.onTab);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            SizedBox(
              width: 64,
            ),
            Text(this.text,
                style: AppFonts.appText.copyWith(
                  color: AppColors.cDarkGrey,
                )),
          ],
        ),
      ),
    );
  }
}
