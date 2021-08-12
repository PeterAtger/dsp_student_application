import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final bool isTitleColorWhite;
  final bool hasBackButton;
  const TitleBar({
    Key key,
    this.title = '',
    this.isTitleColorWhite = false,
    this.hasBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 32),
        hasBackButton
            ? BackButton(isTitleColorWhite: isTitleColorWhite) // Find Below
            : SizedBox(),
        SizedBox(width: 8),
        Text(
          this.title,
          style: AppFonts.heading5.copyWith(
              color:
                  isTitleColorWhite ? AppColors.cWhite : AppColors.cDarkGrey),
        ),
      ],
    );
  }
}

// Back Button
class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
    @required this.isTitleColorWhite,
  }) : super(key: key);

  final bool isTitleColorWhite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Future.delayed(Duration(milliseconds: 250), () {
          Navigator.of(context).pop();
        });
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 32,
        color: isTitleColorWhite ? AppColors.cWhite : AppColors.cDarkGrey,
      ),
    );
  }
}
