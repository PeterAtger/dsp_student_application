//New query urgent bar consists of Text widget "Urgent" , swich , Image -> check

import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Logic/send_questions/send_questions_cubit.dart';
import 'package:dsp_student_application/Logic/urgent_bar_cubit/urgentbarcubit_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/LightPageSnackBar.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class UrgentBar extends StatelessWidget {
  final TextEditingController controller;

  UrgentBar({this.controller});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UrgentBarCubit(),
      child: BlocBuilder<UrgentBarCubit, UrgentbarState>(
        builder: (context, stateUrgent) {
          return BlocProvider(
            create: (context) => SendQuestionsCubit(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(
                      LocaleKeys.urgent.tr(),
                      style: AppFonts.bodyText1,
                    ),
                    Container(
                      child: Switch(
                          value: stateUrgent.isUrgent,
                          activeColor: AppColors.cGreen,
                          onChanged: (value) {
                            context.read<UrgentBarCubit>().changeUrgent(value);
                          }),
                    )
                  ]),
                  BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
                    builder: (context, state) {
                      return BlocListener<SendQuestionsCubit,
                          SendQuestionsState>(
                        listener: (context, state) {
                          if (state.code >= 200 && state.code <= 299) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Your question was sent successfully")));
                            // take the answer and use it in the answered questions
                          } else
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Something went wrong!")));
                        },
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "lib/Presentation/Images/check.svg",
                            height: 32,
                            color: AppColors.cGreen,
                          ),
                          onPressed: () {
                            if (state.isConnected) {
                              context
                                  .read<SendQuestionsCubit>()
                                  .sendQuestionsPostRequest(
                                      controller.text, stateUrgent.isUrgent);
                            } else
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
