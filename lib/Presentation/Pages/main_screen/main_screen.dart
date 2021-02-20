//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
//import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
//dsp_student_application\lib\Presentation\Pages\settings_screen
//import 'package:ff_navigation_bar/ff_navigation_bar.dart';


// String input=""; You can save the input sentence 
// in this variable useing onchanged properity in textfield widget.


class main_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    appBar: applicationBar(),
    body: applicationBody(),
    bottomNavigationBar:navBar(),
    );
  }
}
  AppBar applicationBar() {
    return AppBar(
      toolbarHeight: 122,
      leading: Icon(Icons.menu, size:32, color:Color(0xFF5D5D5D),) ,
      title: Text('Tashkeel', style: AppFonts.heading2,),
       backgroundColor: Colors.transparent,
       elevation: 0,
  );
  }

///////////////////////////////////////////////
//////////////////////////////////////////////
Column applicationBody() {
    return Column(  
    children:[
      
      Padding(
        padding: const EdgeInsets.fromLTRB(45,10,45,10),
        child: search(),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(45,10,45,10),
        child: newQuary(),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(45,10,45,10),
        child: fileUpload(),
      ),
      Text(
        '*Disclaimer: The file size should not exceed 10 Mbs',
        style: AppFonts.versionControl,
      )
    ],
    
  );
  }

TextField search() {
  return TextField(
      decoration: InputDecoration(
        hintText:'Search',
        hintStyle: AppFonts.appText,
        contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 16),
        suffixIcon:Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.yellow,
            style: BorderStyle.solid,
          ),
        ),
      ),
  );
}

TextField newQuary() {
  return TextField(
   /* onChanged: (text) {
      input=text;
    } ,*/   //To have the input Quary in a string variable "input"
    maxLines: 11,
    decoration: InputDecoration(
        hintText:'Write a new Query',
        hintStyle: AppFonts.appText,
        contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Color(0xFF1BB7A5),
            style: BorderStyle.solid,
          ),
        ),
      ),
  );
}


TextField fileUpload() {
  return TextField(
      decoration: InputDecoration(
        hintText:'Upload Text file',
        hintStyle: AppFonts.appText,
        contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 16),
        suffixIcon:Icon(Icons.add),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.yellow,
            style: BorderStyle.solid,
            //width: 3,
          ),
        ),
      ),
      
  );
}

////////////////////////////////////////////
///////////////////////////////////////////

 BottomNavigationBar navBar() {

    return BottomNavigationBar(
      iconSize: 25,  
      elevation: 2,
        //onTap: _onItemTapped,  
      backgroundColor: Color(0xFF474F8F),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Done',
          ),
        ]
      );
  }