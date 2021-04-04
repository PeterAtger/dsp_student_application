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
    return Stack(children: [
      //Screen Backgroud
      ArabicImage(
        size: size.height / 1.5,
        top: -170,
        right: -250,
        blendMode: BlendMode.srcATop,
      ),

      Column(
        children: [
          SizedBox(height: 72),
          Row(
            children: [
              SizedBox(
                width: 32,
              ),
            ],
          )
        ],
      ),

      //Screen content
      Container(
        height: size.height * 0.7,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ///Creation of search text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFieldCreation(
                width: size.width,
                height: size.height,
                text: 'Search',
                icon: Icon(Icons.search,
                    size: 35, color: AppColors.cDarkGrey[900]),
              ),
            ),

            ///Creation of New Quary text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GradientOutline(
                radius: 35,
                chld: Column(
                  children: [
                    TextFieldCreation(
                        width: size.width,
                        height: size.height,
                        text: 'Write a new Query',
                        maximumLines: 11,
                        border: false),
                    UrgantBar(),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                ///Creation of File upload textfield
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                  child: TextFieldCreation(
                      width: size.width,
                      height: size.height,
                      text: 'Upload Text file',
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 35,
                        color: AppColors.cGreen,
                      )),
                ),

                /// The Disclaimer
                Center(
                  child: AutoSizeText(
                    '*Disclaimer: The file size should not exceed 10 Mbs',
                    style: AppFonts.versionControl,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
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
            color: AppColors.cGreen[900],
          ),
        ],
      ),
    );
  }
}
