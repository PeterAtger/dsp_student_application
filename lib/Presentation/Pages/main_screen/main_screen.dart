import 'package:dsp_student_application/Presentation/global_components/ArabicImage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/nav_bar.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/create_text_field.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      drawer: SideMenu(),
      // appBar: screenBar(),
      body: ScreenBody(),
      bottomNavigationBar: NavBar(),
    );
  }

  PreferredSize screenBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .03),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                size: 32,
                color: AppColors.cDarkGrey[700],
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Tashkeel ',
              style: AppFonts.heading2.copyWith(
                color: AppColors.cDarkGrey[700],
              )),
        ),
      ),
    );
  }
}

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        //Screen Backgroud
        ArabicImage(
          size: size.height / 1.5,
          top: -size.height / 6,
          right: -250,
          blendMode: BlendMode.srcATop,
          opacity: 0.05,
        ),

        //Screen content
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 72),
            width: size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///Creation of search text field
                TextFieldCreation(
                  width: size.width,
                  height: size.height,
                  text: 'Search',
                  icon:
                      Icon(Icons.search, size: 36, color: AppColors.cDarkGrey),
                ),

                SizedBox(height: 36),

                ///Creation of New Quary text field
                GradientOutline(
                  radius: 36,
                  chld: Column(
                    children: [
                      TextFieldCreation(
                          width: size.width,
                          height: size.height,
                          text: 'Write a new Query',
                          maximumLines: 12,
                          border: false),
                      UrgantBar(),
                    ],
                  ),
                ),

                SizedBox(height: 36),

                Column(
                  children: [
                    ///Creation of File upload textfield
                    TextFieldCreation(
                        width: size.width,
                        height: size.height,
                        text: 'Upload Text file',
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 36,
                          color: AppColors.cGreen,
                        )),

                    SizedBox(height: 8),

                    /// The Disclaimer
                    Center(
                      child: AutoSizeText(
                        '*Disclaimer: The file size should not exceed 10 Mbs',
                        style: AppFonts.versionControl,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

//4.2.2 New quary urgent bar consists of Text widget "Urgent" , swich , Image -> check
class UrgantBar extends StatefulWidget {
  @override
  _UrgantBarState createState() => _UrgantBarState();
}

class _UrgantBarState extends State<UrgantBar> {
  bool isUrgent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              "Urgent ",
              style: AppFonts.appText,
            ),
            Container(
              child: Switch(
                  value: isUrgent,
                  activeColor: AppColors.cGreen,
                  onChanged: (value) {}),
            )
          ]),
          SvgPicture.asset(
            "lib/Presentation/Images/check.svg",
            color: AppColors.cGreen,
          ),
        ],
      ),
    );
  }
}
