import 'package:dsp_student_application/Logic/authentication/authentication_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/DarkPageSnackBar.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/components/BackGroundGradient.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/InputField.dart';
import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/button.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/buttonicon.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/dividingline.dart';
import 'package:dsp_student_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final passwordFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackGroundGradient(),
          ArabicImage(top: -150, left: -200, size: size.height / 1.5),
          ArabicImage(bottom: -150, left: -200, size: size.height / 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 72),
            child: Container(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                      size,
                      AppColors.cWhite,
                      AppColors.cWhite,
                      AppColors.cWhite,
                      LocaleKeys.Email.tr(),
                      'email',
                      true,
                      emailFieldController,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                        size,
                        AppColors.cWhite,
                        AppColors.cWhite,
                        AppColors.cWhite,
                        LocaleKeys.Password.tr(),
                        'key',
                        true,
                        passwordFieldController,
                        isPass: true),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
                    builder: (context, state) {
                      return BlocListener<AuthenticationCubit,
                          AuthenticationState>(
                        listener: (context, state) {
                          if (state.code != null) {
                            if (state.code <= 299 && state.code >= 200) {
                              Navigator.of(context).pushNamed('/MainScreen');
                            }

                            if (state.code <= 499 && state.code >= 400) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(state
                                          .data[state.data.keys.first][0])));
                            }
                            if (state.code <= 599 && state.code >= 500) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Something went wrong!! Please try again.")));
                            }
                          }
                        },
                        child: Container(
                          width: size.width * 0.8,
                          child: Button(
                            size: size,
                            text: LocaleKeys.Login.tr(),
                            textcolor: AppColors.cGreen,
                            buttoncolor: AppColors.cWhite,
                            onButtonPress: () {
                              print("email is :${emailFieldController.text}");
                              print(
                                  "password is :${passwordFieldController.text}");
                              FocusScope.of(context).unfocus();
                              if (state.isConnected == false) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else
                                context
                                    .read<AuthenticationCubit>()
                                    .signInPostRequest(
                                        emailFieldController.text,
                                        passwordFieldController.text);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: Button(
                      size: size,
                      text: LocaleKeys.SignUp.tr(),
                      textcolor: AppColors.cWhite,
                      buttoncolor: AppColors.cGreen,
                      onButtonPress: () async {
                        await Future.delayed(Duration(milliseconds: 250), () {
                          Navigator.of(context).pushNamed('/SignUp');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: InkWell(
                      //Todo: Remove this
                      onDoubleTap: () {
                        Navigator.of(context).pushNamed('/HIW');
                      },
                      onLongPress: () {
                        Navigator.of(context).pushNamed('/MainScreen');
                      },
                      child: DividingLine(
                        size: size,
                        text: LocaleKeys.OrLogInWith.tr(),
                        color: AppColors.cWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 48,
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<InternetconnectionCubit,
                              InternetconnectionState>(
                            builder: (context, state) {
                              return ButtonIcon(
                                size: size,
                                text: LocaleKeys.Facebook.tr(),
                                icon: 'facebook',
                                iconcolor: Colors.blue,
                                textcolor: Colors.blue,
                                buttoncolor: AppColors.cWhite,
                                frame: AppColors.cWhite,
                                onButtonPress: () {
                                  if (state.isConnected == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else
                                    // destination: , //main screen
                                    print('go to main screen');
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<InternetconnectionCubit,
                              InternetconnectionState>(
                            builder: (context, state) {
                              return ButtonIcon(
                                size: size,
                                text: LocaleKeys.Google.tr(),
                                icon: 'googlee',
                                iconcolor: Colors.red,
                                textcolor: AppColors.cDarkGrey,
                                buttoncolor: AppColors.cWhite,
                                onButtonPress: () {
                                  if (state.isConnected == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else
                                    // destination: , //main screen
                                    print('go to main screen');
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
