import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

class TextFieldCreation extends StatelessWidget {
  const TextFieldCreation({
    Key key,
    @required this.size,
    @required this.text,
    this.fieldicon,
    this.maximumLines = 1,
    this.border = true,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconButton fieldicon;
  final bool border;
  final int maximumLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      decoration: (border == false)
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(
                width: 2,
                color: AppColors.cDarkGrey,
                style: BorderStyle.solid,
              ),
            ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AutoSizeTextField(
            style: AppFonts.appText,
            controller: TextEditingController(),
            onChanged: (String txt) {
              print(txt);
            },
            maxLines: maximumLines,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: AppFonts.appText,
              border: InputBorder.none,
              suffixIcon: fieldicon,
            ),
          )),
    );
  }
}
