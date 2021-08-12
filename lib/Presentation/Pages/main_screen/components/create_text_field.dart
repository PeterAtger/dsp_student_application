import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class TextFieldCreation extends StatelessWidget {
  const TextFieldCreation({
    Key key,
    @required this.size,
    @required this.hintText,
    this.fieldicon,
    this.maximumLines = 1,
    this.border = true,
    this.controller,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final IconButton fieldicon;
  final bool border;
  final int maximumLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (border == false)
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: AppColors.cGreen,
              border: Border.all(
                width: 2,
                color: AppColors.cDarkGrey,
                style: BorderStyle.solid,
              ),
            ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AutoSizeTextField(
            style: AppFonts.bodyText1,
            controller: this.controller,
            onChanged: (String txt) {
              print(txt);
            },
            expands: true,
            maxLines: null,
            minLines: null,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppFonts.bodyText1,
              border: InputBorder.none,
              suffixIcon: fieldicon,
            ),
          )),
    );
  }
}
