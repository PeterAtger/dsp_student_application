import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsp_student_application/Logic/load_file/loadfile_cubit.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadfileCubit, LoadfileState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.cDarkGrey, width: 2)),
            child: OutlinedButton(
              onPressed: () {
                context.read<LoadfileCubit>().onButtonClick();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.upload.tr(),
                      style: AppFonts.bodyText1,
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      size: 32,
                      color: AppColors.cGreen,
                    ),
                  ],
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                shadowColor: MaterialStateProperty.all(AppColors.cDarkGrey),
                overlayColor: MaterialStateProperty.all(AppColors.cLightGrey),
                backgroundColor: MaterialStateProperty.all(AppColors.cWhite),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 8),

          /// The Disclaimer
          Center(
            child: AutoSizeText(
              LocaleKeys.disclaimer.tr(),
              style: AppFonts.captionText,
              maxLines: 1,
            ),
          ),
        ],
      );
    });
  }
}
