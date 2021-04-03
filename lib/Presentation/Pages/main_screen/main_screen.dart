import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/nav_bar.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/side_menu.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/creat_text_field.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer : SideMenu(),
       appBar: screenBar(),
       body : ScreenBody(),
       bottomNavigationBar:NavBar(),

    );
  }

  PreferredSize screenBar() {
    return PreferredSize(
       preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.14),
       child: Padding(
         padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*.03),
         child: AppBar(
           leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,    size: 32,   color: AppColors.cDarkGrey[700],),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ), 
           elevation: 0,
           backgroundColor: Colors.transparent,
           title : Text('Tashkeel ', style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[700],)),
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
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Container(
      height:h*.8,
      child:Stack(
        clipBehavior: Clip.none,
        children: [
          //Screen Backgroud
          Positioned(left: 0.35*w, top:-h*0.72 ,
            child:Opacity(
            opacity:0.12,
            child:  Image.asset(
              'lib/Presentation/Images/ArabicCircle.png',
              scale:1.5 ,)
            ),
          ),
          //Screen content
          Container(
            height: h*0.7,
            padding: EdgeInsets.symmetric(horizontal:w*0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ///Creation of search text field 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: TextFieldCreation(w: w, h: h, text: 'Search',
                  icon:Icon(Icons.search , size:35 , color:AppColors.cDarkGrey[900]),),
                ),

              ///Creation of New Quary text field               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: GradientOutline(radius: 35,
                   chld:Column(
                     children: [
                       TextFieldCreation(w: w, h: h, text: 'Write a new Query', maximumLines: 11, border:false),
                       UrgantBar(),
                     ],
                   ), ),
                ),
                              
                Column(
                  children: [
                    ///Creation of File upload textfield
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                      child: TextFieldCreation(w: w, h: h, text: 'Upload Text file', 
                      icon: Icon(Icons.add_circle_outline , size: 35, color: AppColors.cGreen,)),
                    ),
                      /// The Disclaimer
                    Center(
                      child: AutoSizeText(
                      '*Disclaimer: The file size should not exceed 10 Mbs',
                        style: AppFonts.versionControl,   maxLines: 2, ),
                    ),
                  ],
                ),
              ],
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
  bool isUrgent=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: 
            [Text("Urgent ",style:AppFonts.appText,),
             Container(child:Switch(
              value: isUrgent,
              activeColor: AppColors.cGreen,
              onChanged: (value) {
                setState() {
                  isUrgent = value;
                  print(isUrgent);
                }}),
                )]
            ),
            SvgPicture.asset("lib/Presentation/Images/check.svg",color: AppColors.cGreen[900],),
            ],
      ),
    );
  }
}
