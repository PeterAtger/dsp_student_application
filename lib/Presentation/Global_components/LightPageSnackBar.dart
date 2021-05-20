import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

final snackBar = SnackBar(
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
  duration: Duration(milliseconds: 500),
  backgroundColor: AppColors.cDarkGrey,
  content: Container(
    height: 16,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.block_flipped,
          color: AppColors.cGreen,
          size: 16,
        ),
        Text(
          '  No Internet connection',
          textAlign: TextAlign.center,
          style: AppFonts.captionText.copyWith(
            color: AppColors.cWhite,
          ),
        ),
      ],
    ),
  ),
);
