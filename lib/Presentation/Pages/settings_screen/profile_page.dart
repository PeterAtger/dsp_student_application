import 'dart:io';

import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Logic/nav_bar/navbar_cubit.dart';
import 'package:dsp_student_application/Logic/profile_image/profile_image_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_student_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/QuestionButton.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/TeacherProfileInf.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // Body
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileImageCubit>(
            create: (BuildContext context) => ProfileImageCubit(),
          ),
        ],
        child: Stack(
          children: [
            // Upper colored Box
            Container(
              height: size.height / 3,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.cGreen, AppColors.cPurple]),
              ),
            ),
            // Image
            Positioned(
              right: -size.height / 3,
              top: -size.height / 3,
              child: Container(
                width: size.height / 1.5,
                height: size.height / 1.5,
                child: BlendMask(
                    blendMode: BlendMode.saturation,
                    opacity: 1,
                    child: Image.asset(
                        'lib/Presentation/Images/ArabicCircle.png')),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 72),
                TitleBar(
                  title: LocaleKeys.Profile.tr(),
                  isTitleColorWhite: true,
                ),
                SizedBox(height: 16),
                // Profile Image
                BlocBuilder<ProfileImageCubit, ProfileImageState>(
                  builder: (context, state) {
                    return InkWell(
                      onLongPress: () {
                        context.read<ProfileImageCubit>().onButtonClick();
                      },
                      child: Center(
                        child: state.imagePath != null
                            ? Container(
                                height: 96,
                                width: 96,
                                child: Image.file(
                                  File(state.imagePath),
                                  fit: BoxFit.cover,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(
                                height: 96,
                                width: 96,
                                decoration: BoxDecoration(
                                  color: AppColors.cWhite,
                                  shape: BoxShape.circle,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Text(
                    'Habiba Ashraf',
                    style: AppFonts.heading5.copyWith(color: AppColors.cWhite),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height / 3,
              child: Container(
                height: size.height * 2 / 3,
                width: size.width,
                decoration: BoxDecoration(color: AppColors.cWhite),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    TeacherProfileInf(
                      field1: '${LocaleKeys.Email.tr()}: ',
                      field2: 'Habiba.Ash@example.com',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TeacherProfileInf(
                      field1: '${LocaleKeys.grade.tr()}: ',
                      field2: 'Secondary',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TeacherProfileInf(
                      field1: '${LocaleKeys.user_since.tr()}: ',
                      field2: '1+ years',
                    ),
                    SizedBox(height: 32),
                    GradientLine(size: size),
                    SizedBox(height: 16),
                    QuestionButton(
                      size: size,
                      text: '${LocaleKeys.AnsweredQuestions.tr()}: 3',
                      green: false,
                      onPressed:
                          context.read<NavbarCubit>().goToAnsweredQuestions,
                    ),
                    SizedBox(height: 16),
                    QuestionButton(
                      size: size,
                      text: '${LocaleKeys.WaitingQuestion.tr()}: 3',
                      green: true,
                      onPressed:
                          context.read<NavbarCubit>().goToWaitingQuestions,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
