import 'package:dsp_student_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_in.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/services.dart';
import 'Presentation/Pages/sign/get_started.dart';
import 'Presentation/Pages/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: AppColors.cPurple,
        accentColor: AppColors.cGreen,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'lato',
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0))),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GetStarted(),
      },
    );
  }
}
