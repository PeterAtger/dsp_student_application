import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/NavBar.dart';
import 'dart:math' as math;
//import 'package:custom_switch/custom_switch.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: SideMenu(),
    appBar:screenbar(),
    body: ScrBody(),
    bottomNavigationBar:NavBar(),
    );
  }}

  // screen bar Presentation
  PreferredSize screenbar() {
    return PreferredSize(
    preferredSize: Size.fromHeight(100.0),
    child:AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0,
      //Text
      title: AutoSizeText('Tashkeel', style: AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[700])),
      //Menu icon
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: (Icon(Icons.menu, size:32, color:AppColors.cDarkGrey[700],) ),
            onPressed: () { Scaffold.of(context).openDrawer(); },
          );},
        ),),
    );
  }
///
/* The main body is devided of 3 layers :
  layer_1 : Set the look of the screen (need modification)
  Layer_2 : deviding the screen to 3 main container : one for search ,one for adding quary ,one for uploading file
  Layer_3 : set up the containers decoration and main componants
  Layer_4 : setting up the componants of the containers*/ 

//screen body presentation layer_1
/* I have a problem here with importing the image that i want in the background
The stack should be fixed so that the image appeare at the background */
class ScrBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height*.8,
      child:Stack(children:
          [//Container(child:Image(image:AssetImage('ArabicCircle.png'),)), 
          screenBody(),
          ]),);
  }
}
/////////////////////////////
/////////////////////////////
Column screenBody() {
    return Column(  
    children:[   
      ///Search Method call
      Padding(
        padding: const EdgeInsets.fromLTRB(55,0,55,8),
        child: search(),
      ),
      ///New Quary Method call
      Padding(
        padding: const EdgeInsets.fromLTRB(55,9,55,9),
        child: newquary(),),
      ///File upload Method call
      Padding(
        padding: const EdgeInsets.fromLTRB(55,10,55,8),
        child: fileupload(),
      ),
      /// The Disclaimer
      AutoSizeText(
          '*Disclaimer: The file size should not exceed 10 Mbs',
           style: AppFonts.versionControl,   maxLines: 2,
      )
    ],
    
  );
}
///////////////////////////
//Layer_3
///3.1 The search Method 
Container search(){
  return Container (
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: AppColors.cDarkGrey[500], style: BorderStyle.solid,),
        ),

    child: Padding(
      padding: const EdgeInsets.fromLTRB(25,0,20,0),
      child: SearchField(),
      ),
    )
  ;}
///3.2 The newquary Method 
/* The border is implemented by to container the outer one has gradient and the inner has white color*/
Container newquary(){
  return Container (
    padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.9, 0.0), 
          colors: [AppColors.cPurple[900], AppColors.cGreen[900]], 
          tileMode: TileMode.clamp, 
        ), 
      ),
      child:Container(
        padding: const EdgeInsets.fromLTRB(8,8,0,0),
        decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(30.0),
          ),         
        child: Column(
          children: [NewQuaryField(), UrgantBar(),],)
          )
  )
;}
///3.3 The file upload Method 
Container fileupload(){
  return Container (
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(color: AppColors.cDarkGrey[500], style: BorderStyle.solid,),
        ),

    child: Padding(
      padding: const EdgeInsets.fromLTRB(25,0,20,0),
      child: FileUploadField(),
      ),
    )
  ;}


//////////////////////////////////////////
//Layer_4
//4.1 search text field
class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String serch="";

  @override
  Widget build(BuildContext context) {
    return TextField(
    decoration: InputDecoration(
      hintText:'Search',
      hintStyle: AppFonts.appText,
      border: InputBorder.none,
      suffixIcon:Icon(Icons.search),
    ),
    onChanged: (String search){serch=search;},
  );
  }
}

//4.2.1 New quary text field
class NewQuaryField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String input="";
    return AutoSizeTextField(
    controller:TextEditingController(),
    onChanged: (text) {
      input=text;
    } ,   //To have the input Quary in a string variable "input"
    maxLines: 12,
    decoration: InputDecoration(
        hintText:'Write a new Query',
        hintStyle: AppFonts.appText,
        contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 17),
        border: InputBorder.none,
      ),
  );
  }
}

//4.2.2 New quary urgent bar
class UrgantBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,0,30,8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: 
            [Text("Urgent ",style:AppFonts.appText,),
             Container(child:SwitchWidget())]
            ),
            Icon(Icons.search),
            ],
            ),
    );
  }
}

//4.3 file upload text field
class FileUploadField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoSizeTextField(
    controller:TextEditingController(),
    decoration: InputDecoration(
      hintText:'Upload Text file',
      hintStyle: AppFonts.appText,
      border: InputBorder.none,
      suffixIcon:Icon(Icons.add), 
    ),
  );
  }
}


////////////////////////////
//Urgent switch implementation
class SwitchWidget extends StatefulWidget {
    @override
    SwitchWidgetClass createState() => new SwitchWidgetClass();
  }
  
class SwitchWidgetClass extends State {

  bool switchControl = false;
  
  void toggleSwitch(bool value) {

      if(switchControl == false)
      {
        setState(() {switchControl = true;});
        // Put your code here which you want to execute on Switch ON event.
      }
      else
      {
        setState(() {switchControl = false;});
        // Put your code here which you want to execute on Switch OFF event.
      }
  }
  
    @override
    Widget build(BuildContext context) {
      return Container( 
              child: Switch(
              onChanged: toggleSwitch,
              value: switchControl,
              activeColor: AppColors.cGreen,
            )
      );
  }
}

////////////////////////////
// side mwnu implimentation
class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
           elevation: 0,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal:22),
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1 ,),
            Row(children:[
                Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,    size: 32,
                         color: AppColors.cDarkGrey[700],
                         ),
                        onPressed: null,
                     ),
                   ),
                Text("Menu",style:AppFonts.heading2.copyWith(color: AppColors.cDarkGrey[700]) ,)],
           ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05 ,),
            Row(children:[
                 Icon(Icons.supervised_user_circle , size:32,),
                 Text(" UserName",style:AppFonts.heading3.copyWith(color: AppColors.cDarkGrey[700]),),
               ]),
                
            Divider(
              color: AppColors.cGreen,
              thickness: 3,
              indent: 35,
              endIndent: 35,
              ),
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
            Divider(
              height: 15,
              color: AppColors.cGreen,
              thickness: 3,
              indent: 35,
              endIndent: 35,
             ),
            SizedBox(height: MediaQuery.of(context).size.height*0.3 ,),
            Text("APP VERSION 0.0.2 Alpha  ",style:AppFonts.versionControl,textAlign: TextAlign.center,),   
            ],
          ),
      )
    ;
  }
}