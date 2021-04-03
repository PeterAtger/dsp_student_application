import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[AppColors.cPurple, AppColors.cGreen],
).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 100.0));

class SideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // give it The desired border radius
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
        topRight:Radius.circular(50),
      ),
      // wrap with a sizedbox for a custom width [for more flexibility]
      child: SizedBox(
        width: 270,
        child: Drawer(
          child: SidMenu(),
        ),
      ),
    );
  }
}

class SidMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
     elevation: 0,
     child: ListView(       
      padding: EdgeInsets.symmetric(horizontal:9),
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height*0.075 ,),
        Row(children:[
            Transform.rotate(
              angle: 90 * math.pi / 180,
              child: IconButton(
                icon: Icon(
                  Icons.menu,    size: 32,
                  color: AppColors.cDarkGrey[700],
                ),
                onPressed:()=>Navigator.pushReplacementNamed(context,'/mainScreen'),
                ),
            ),
            Text("Menu",style:AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[700]) ,)
            ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.05 ,),
        Row(
          children:[
            Icon(Icons.supervised_user_circle , size:32,),
            Text(" UserName",style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]),),
          ]
        ),
        Devidr(),   
        ListTile(
          title: Text('Profile',style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]) ,),
          onTap: () => {},
        ),
        ListTile(
          title: Text('help',style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]) ,),
          onTap: () => {},
        ),
        ListTile(
          title: Text('setting',style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]) ,),
          onTap: () => {},
        ),
        ListTile(
          title: Text('log out',style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]) ,),
          onTap: () => {},
        ),
        Devidr(),  
        SizedBox(height: MediaQuery.of(context).size.height*0.18),
        Text("APP VERSION 0.0.2 Alpha  ",textAlign:TextAlign.center,//style:AppFonts.versionControl, 
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient),
        )
         ],
       ),
      );
  }
}

class Devidr extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:12 , horizontal: 30),
      child: SizedBox(
      width: 200,
      height: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( 
            begin: Alignment.topLeft,
            end: Alignment(0.9, 0.0), 
            colors: [AppColors.cPurple[900], AppColors.cGreen[900]], ),
        ),
      ),
    ),
    );
  }
}
