import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Data/Repositories/authentication.dart';
import 'package:dsp_student_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_student_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/ContactUsList.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/IconListSetting.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:dsp_student_application/Presentation/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              right: -size.height / 3,
              top: -size.height / 3,
              child: Container(
                width: size.height / 1.5,
                height: size.height / 1.5,
                child: BlendMask(
                    blendMode: BlendMode.srcOver,
                    opacity: 0.1,
                    child: Image.asset(
                        'lib/Presentation/Images/ArabicCircle.png')),
              ),
            ),
            Column(children: [
              SizedBox(height: 72),
              TitleBar(title: LocaleKeys.Settings.tr()),
              SizedBox(height: 24),
              Row(children: <Widget>[
                SizedBox(width: 32),
                Text(
                  LocaleKeys.AppSettings.tr(),
                  style: AppFonts.heading5.copyWith(color: AppColors.cDarkGrey),
                ),
              ]),
              SizedBox(height: 24),
              IconListSetting(
                iconName: 'notification',
                settingText: LocaleKeys.Notifications.tr(),
                onTab: () {
                  Navigator.of(context)
                      .pushNamed('/MainScreen/Settings/Notifications');
                },
              ),
              IconListSetting(
                iconName: 'book',
                settingText: LocaleKeys.TermsOfUse.tr(),
                onTab: () {},
              ),
              IconListSetting(
                iconName: 'how_it_works_question_mark',
                settingText: LocaleKeys.HowItWorks.tr(),
                onTab: () {
                  Navigator.of(context).pushReplacementNamed('/HIW');
                },
              ),
              IconListSetting(
                  iconName: 'earth-globe',
                  settingText: LocaleKeys.Change_Language.tr(),
                  onTab: () {
                    if (context.locale == Locale('en')) {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  }),
              IconListSetting(
                iconName: 'profile',
                settingText: LocaleKeys.LogOut.tr(),
                onTab: () {
                  Tokens.signInToken = null;
                  Navigator.of(context).pushReplacementNamed('/signIn');
                },
              ),
              SizedBox(height: 32),
              GradientLine(size: size),
              SizedBox(height: 16),
              Row(children: <Widget>[
                SizedBox(width: 32),
                Text(
                  LocaleKeys.ContactUs.tr(),
                  style: AppFonts.heading5.copyWith(color: AppColors.cDarkGrey),
                ),
              ]),
              SizedBox(height: 24),
              ContactUsList(
                iconName: 'phone',
                contactText: '+202 991 991 991',
              ),
              SizedBox(height: 8),
              ContactUsList(
                iconName: 'internet',
                contactText: 'www.rdi-eg.ai',
              ),
              SizedBox(height: 8),
              ContactUsList(
                iconName: 'email2',
                contactText: 'info@rdi-eg.ai',
              ),
              SizedBox(height: 8),
              ContactUsList(
                iconName: 'location',
                contactText: '3, Haroon st., Giza, Egypt',
              )
            ]),
          ],
        ),
      ),
    );
  }
}
