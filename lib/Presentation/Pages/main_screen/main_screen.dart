import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Logic/load_file/loadfile_cubit.dart';
import 'package:dsp_student_application/Presentation/Global_components/ArabicImage.dart';
import 'package:dsp_student_application/Logic/internet_connection/internetconnection_cubit.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/gradientOutline.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/components/create_text_field.dart';
import 'package:dsp_student_application/Presentation/Global_components/LightPageSnackBar.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBody();
  }
}

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        //Screen Backgroud
        ArabicImage(
          size: size.height / 1.5,
          top: -size.height / 3,
          right: -size.height / 3,
          blendMode: BlendMode.srcATop,
          opacity: 0.05,
        ),

        //Screen content
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(bottom: 72),
              height: size.height - 56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Menu bar
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 32,
                            color: AppColors.cDarkGrey,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(LocaleKeys.MainScreen.tr(),
                            style: AppFonts.heading5.copyWith(
                              color: AppColors.cDarkGrey,
                            )),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SearchBar(size: size),
                        QueryField(size: size),
                        UploadButton(size: size),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

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
            width: 0.8 * size.width,
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

class QueryField extends StatelessWidget {
  const QueryField({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GradientOutline(
      size: size,
      radius: 32,
      chld: Column(
        children: [
          BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
            builder: (context, state) {
              return TextFieldCreation(
                  size: size,
                  text: state.isConnected
                      ? LocaleKeys.write_new_query.tr()
                      : "No internet coneection",
                  maximumLines: (size.height * 0.3 / 22).floor(),
                  border: false);
            },
          ),
          UrgantBar(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
      builder: (context, state) {
        return TextFieldCreation(
          size: size,
          text: LocaleKeys.search.tr(),
          fieldicon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32,
              color: AppColors.cDarkGrey,
            ),
            onPressed: () {
              if (state.isConnected)
                print(LocaleKeys.search.tr());
              else
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        );
      },
    );
  }
}

//New quary urgent bar consists of Text widget "Urgent" , swich , Image -> check
class UrgantBar extends StatefulWidget {
  @override
  _UrgantBarState createState() => _UrgantBarState();
}

class _UrgantBarState extends State<UrgantBar> {
  bool isUrgent = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  value: isUrgent,
                  activeColor: AppColors.cGreen,
                  onChanged: (value) {}),
            )
          ]),
          BlocBuilder<InternetconnectionCubit, InternetconnectionState>(
            builder: (context, state) {
              return IconButton(
                icon: SvgPicture.asset(
                  "lib/Presentation/Images/check.svg",
                  height: 32,
                  color: AppColors.cGreen,
                ),
                onPressed: () {
                  if (state.isConnected)
                    print(LocaleKeys.search.tr());
                  else
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
