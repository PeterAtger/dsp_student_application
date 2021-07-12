import 'package:adobe_xd/adobe_xd.dart';
import 'package:dsp_student_application/Presentation/Global_components/GradientLine.dart';
import 'package:dsp_student_application/Presentation/Global_components/TitleBar.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/ContactUsList.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/local_components/IconListSetting.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dsp_student_application/Presentation/translations/lokale_keys.g.dart';
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
      body: Stack(
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
                  child:
                      Image.asset('lib/Presentation/Images/ArabicCircle.png')),
            ),
          ),
          Column(children: [
            SizedBox(height: 72),
            TitleBar(title: 'Settings'),
            SizedBox(height: 24),
            Row(children: <Widget>[
              SizedBox(width: 32),
              Text(
                'App settings',
                style: AppFonts.heading5.copyWith(color: AppColors.cDarkGrey),
              ),
            ]),
            SizedBox(height: 24),
            IconListSetting(
              iconName: 'notification',
              settingText: 'Notifications',
              onTab: () {
                Navigator.of(context)
                    .pushNamed('/MainScreen/Settings/Notifications');
              },
            ),
            IconListSetting(
              iconName: 'book',
              settingText: 'Terms of use',
              onTab: () {},
            ),
            IconListSetting(
              iconName: 'how_it_works_question_mark',
              settingText: 'How it works',
              onTab: () {},
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
              settingText: 'Log out',
              onTab: () {},
            ),
            SizedBox(height: 32),
            GradientLine(size: size),
            SizedBox(height: 16),
            Row(children: <Widget>[
              SizedBox(width: 32),
              Text(
                'Contact Us',
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
    );
  }
}
