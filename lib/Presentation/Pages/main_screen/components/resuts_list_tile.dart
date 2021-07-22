import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class ResultListTile extends StatelessWidget {
  const ResultListTile({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.cWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    this.text,
                    style: AppFonts.bodyText1,
                    overflow: TextOverflow.fade,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
