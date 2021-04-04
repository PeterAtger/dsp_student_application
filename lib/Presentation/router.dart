import 'package:dsp_student_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:dsp_student_application/Presentation/Pages/main_screen/main_screen.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_in.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_up.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/HIW':
        return MaterialPageRoute(builder: (_) => HIW());
      case '/MainScreen':
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
