import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[AppColors.cPurple, AppColors.cGreen],
).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 100.0));

class SideMenu extends StatelessWidget {
  final Size size;

  const SideMenu({Key key, this.size}) : super(key: key);

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
        width: size.width / 1.5,
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
  static final List<String> items = ['Profile', 'Help', 'Settings', 'Log Out'];

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

                GradientLine(width: size.width / 1.5),

                Column(
                  children: items
                      .map((e) => InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/${e.toLowerCase()}'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 64,
                                  ),
                                  Text(e,
                                      style: AppFonts.appText.copyWith(
                                        color: AppColors.cDarkGrey,
                                      )),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),

                GradientLine(
                  width: size.width / 1.5,
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

class GradientLine extends StatelessWidget {
  final double width;

  const GradientLine({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        height: 1,
        width: width * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.cPurple, AppColors.cGreen],
          ),
        ),
      ),
    );
  }
}
