import 'package:dsp_student_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/main_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/settings_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/splash_screen/splash_screen.dart';
import 'package:dsp_student_application/Presentation/Theme/theme.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainScreen(),
        '/mainScreen': (context) => MainScreen(),
        //'/howItWorks': (context) => HIW1(),
        // '/profile': (context) => Profile(),
        // '/setting': (context) => Settings(),
      },
      initialRoute: '/mainScreen',
    );
  }
}
