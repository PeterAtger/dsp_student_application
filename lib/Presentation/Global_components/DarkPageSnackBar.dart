import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';

final snackBar = SnackBar(
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
  duration: Duration(seconds: 5),
  backgroundColor: AppColors.cWhite.withOpacity(0.7),
  content: Container(
    height: 16,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.block_flipped,
          color: AppColors.cPurple,
          size: 16,
        ),
        Text(
          '  No Internet connection',
          textAlign: TextAlign.center,
          style: AppFonts.captionText.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.cPurple,
          ),
        ),
      ],
    ),
  ),
);
