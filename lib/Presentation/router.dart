import 'package:dsp_student_application/Presentation/Pages/how_it_works/HIW.dart';
import 'package:dsp_student_application/Presentation/Pages/sign/sign_in.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HIW());
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => SignIn());
    }
  }
}
