import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 122,
      leading: Icon(Icons.menu, size:32, color:Color(0xFF5D5D5D),) ,
      title: Text('Tashkeel', style: AppFonts.heading2,),
       backgroundColor: Colors.transparent,
       elevation: 0,
      ),
    );
  }
}