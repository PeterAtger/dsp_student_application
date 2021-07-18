import 'package:dsp_student_application/Presentation/Pages/error_screen/error_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/search_screen.dart';
import 'package:dsp_student_application/Presentation/main_page.Dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/notifications.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/profile_page.dart';
import 'package:dsp_student_application/Presentation/Pages/settings_screen/settings_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_in.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_up.dart';
import 'package:dsp_student_application/Presentation/Pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/HIW':
        return MaterialPageRoute(builder: (_) => HIW());
      case '/MainScreen':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/MainScreen/Search':
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case '/MainScreen/Settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/MainScreen/Profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/MainScreen/Settings/Notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      default:
        return MaterialPageRoute(builder: (_) => ErorrScreen());
    }
  }
}
