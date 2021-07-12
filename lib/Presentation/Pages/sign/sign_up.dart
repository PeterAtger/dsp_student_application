import 'package:dsp_student_application/Logic/authentication/authentication_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/LightPageSnackBar.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/InputField.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/button.dart';
import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/buttonicon.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/dividingline.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/components/top_curve.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _gradeList = [
    [LocaleKeys.grade.tr(), 'lib/Presentation/Images/greade.svg'],
    [LocaleKeys.Primary.tr(), 'lib/Presentation/Images/boysvg.svg'],
    [LocaleKeys.Preparatory.tr(), 'lib/Presentation/Images/girl.svg'],
    [LocaleKeys.Secondary.tr(), 'lib/Presentation/Images/secondaryboy.svg']
  ];
  String _selectedItem;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedItem = _gradeList[0][0];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.cWhite,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            painter: TopCurvePainter(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          ArabicImage(
              top: -150,
              left: -size.height / 5,
              size: size.height / 1.5,
              opacity: 0.5),
          CustomPaint(
            painter: TopCurvePainterRev(),
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
            ),
          ),
          Container(
            child: Positioned(
              top: size.height * 0.13,
              child: Text(
                LocaleKeys.SignUp.tr(),
                style: AppFonts.heading3.copyWith(color: AppColors.cWhite),
              ),
            ),
          ),
          Container(
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 72),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: size.width * 0.8,
                      child: inputfield(
                          size,
                          AppColors.cLightGrey,
                          AppColors.cDarkGrey,
                          AppColors.cDarkGrey,
                          LocaleKeys.FullName.tr(),
                          'name',
                          false,
                          nameController)),
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                        size,
                        AppColors.cLightGrey,
                        AppColors.cDarkGrey,
                        AppColors.cGreen,
                        LocaleKeys.Email.tr(),
                        'email',
                        true,
                        emailController),
                  ),
                  SizedBox(
                    height: 4, //bad value
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: inputfield(
                        size,
                        AppColors.cLightGrey,
                        AppColors.cDarkGrey,
                        AppColors.cGreen,
                        LocaleKeys.Password.tr(),
                        'key',
                        true,
                        passController,
                        isPass: true),
                  ),
                  SizedBox(
                    height: 4, //bad value
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 24, bottom: 12, left: 12, right: 12),
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.cLightGrey)),
                        ),
                        value: _selectedItem,
                        dropdownColor: AppColors.cWhite,
                        elevation: 2,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value.toString();
                          });
                        },
                        items: _gradeList
                            .map((item) => DropdownMenuItem(
                                value: item[0],
                                child: Row(
                                  children: [
                                    Container(
                                        height: 24,
                                        width: 24,
                                        child: SvgPicture.asset(item[1])),
                                    SizedBox(width: 12),
                                    Text(item[0],
                                        style: AppFonts.bodyText1.copyWith(
                                          color: AppColors.cDarkGrey,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ],
                                )))
                            .toList()),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
                    builder: (context, state) {
                      return BlocListener<AuthenticationCubit,
                          AuthenticationState>(
                        listener: (context, state) {
                          if (state.code != null) {
                            if (state.code <= 299 && state.code >= 200) {
                              Navigator.of(context).pushNamed('/HIW');
                            }

                            if (state.code <= 499 && state.code >= 400) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(state.data["email"][0])));
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
                            text: LocaleKeys.SignUp.tr(),
                            textcolor: AppColors.cWhite,
                            buttoncolor: AppColors.cGreen,
                            onButtonPress: () async {
                              await context
                                  .read<InternetconnectionCubit>()
                                  .checkConnection();
                              if (state.isConnected == false) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else
                                context
                                    .read<AuthenticationCubit>()
                                    .signUpPostRequest(
                                        nameController.text,
                                        emailController.text,
                                        passController.text);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: DividingLine(
                      size: size,
                      text: LocaleKeys.OrLogInWith.tr(),
                      color: AppColors.cDarkGrey,
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
                                onButtonPress: () async {
                                  if (state.isConnected == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else
                                    await Future.delayed(
                                        Duration(milliseconds: 250), () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/HIW');
                                    });
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
                                onButtonPress: () async {
                                  if (state.isConnected == false) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else
                                    await Future.delayed(
                                        Duration(milliseconds: 250), () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/HIW');
                                    });
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
          ),
        ],
      ),
    );
  }
}

class SignUpGradient extends StatelessWidget {
  const SignUpGradient({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.49,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0, 1],
            colors: [AppColors.cPurple, AppColors.cGreen]),
      ),
    );
  }
}
