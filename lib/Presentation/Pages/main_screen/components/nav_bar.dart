import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  
    List<String> _widgetOptions = [
    '/profile',
    '/setting',
    '/MainScreen',
    '/profile',
    '/profile',
  ];
  void _onItemTap(int index) {
    setState(() {
    Navigator.pushReplacementNamed(context, _widgetOptions[index]);
     //(index==2)?Navigator.popUntil(context, ModalRoute.withName('/QuestionsList')):Navigator.pushNamed(context, _widgetOptions[index]);
    });

  }
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        style: TabStyle.fixedCircle,
        height: MediaQuery.of(context).size.height*0.09,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end:
              Alignment(0.9, 0.0), 
          colors: [AppColors.cPurple[900], AppColors.cGreen[900]], 
          tileMode: TileMode.clamp, 
        ),

        items: [
          TabItem(icon: SvgPicture.asset('lib/Presentation/Images/user_outlined.svg' ,color:AppColors.cLightGrey , height: 28,)),
          TabItem(icon: SvgPicture.asset('lib/Presentation/Images/setting.svg' ,color:AppColors.cLightGrey , height: 28,)),
          TabItem(icon: Icon(Icons.home_rounded, color:AppColors.cDarkGrey[900], size:45)),
          TabItem(icon: SvgPicture.asset('lib/Presentation/Images/question.svg' ,color:AppColors.cLightGrey , height: 28,)),
          TabItem(icon: Icon(Icons.check_circle_outline_sharp, color:AppColors.cLightGrey, size:28)),
        ],
        //initialActiveIndex: 0,
        onTap: _onItemTap,
        
      );
  }
}