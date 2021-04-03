import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
class TextFieldCreation extends StatelessWidget {
  const TextFieldCreation({
    Key key,
    @required this.w,
    @required this.h,
    @required this.text,
    this.icon,
    this.maximumLines=1,
    this.border=true,
  }) : super(key: key);
  
  final double w;
  final double h;
  final String text;
  final Icon icon;
  final bool border; 
  final int maximumLines;

  @override
  Widget build(BuildContext context) {
    return Container (
    decoration: (border==false)? null:BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      border: Border.all(width:2, color: AppColors.cDarkGrey[500], style: BorderStyle.solid,),
        ),

    child: Padding(
      padding: EdgeInsets.symmetric(horizontal:w*0.05),
      child: AutoSizeTextField(
        controller:TextEditingController(),
        onChanged: (String txt) {
        print(txt);
        } ,
        maxLines: maximumLines,
    decoration: InputDecoration(
      hintText:text,
      hintStyle: AppFonts.appText,
      border: InputBorder.none,
      suffixIcon:icon, 
    ),
  )
      ),
    );
  }
}