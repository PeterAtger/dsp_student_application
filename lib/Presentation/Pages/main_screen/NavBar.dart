import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
//import 'package:dsp_student_application/Presentation/Pages/main_screen/main_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  
  int _selectedIndex;
    /*List<Widget> _widgetOptions = <Widget>[
    main_screen(),
    main_screen(),
    main_screen(),
    main_screen(),
    main_screen(),
  ];*/
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
        backgroundColor: AppColors.cPurple[800],
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
          TabItem(icon: ImageIcon(Svg("assets/user_outlined.svg") ,color:AppColors.cLightGrey , size: 28,)),
          TabItem(icon: Icon(Icons.settings, color:AppColors.cGreen, size:28,)),
          TabItem(icon: Icon(Icons.home_outlined, color:Colors.black, size:33)),
          TabItem(icon: ImageIcon(Svg("assets/question.svg") ,color:AppColors.cLightGrey , size: 28,)),
          TabItem(icon: Icon(Icons.check_circle_outline_sharp, color:AppColors.cLightGrey, size:28)),
        ],
        //initialActiveIndex: 0,
        onTap: _onItemTap,
       // onTap:(int index){},
      );
  }
}