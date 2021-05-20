import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  const AppFonts();
  static final TextStyle heading1 = GoogleFonts.lato(
      fontSize: 101, fontWeight: FontWeight.w300, letterSpacing: -1.5);

  static final TextStyle heading2 =
      GoogleFonts.lato(fontSize: 63, fontWeight: FontWeight.w300);

  static final TextStyle heading3 =
      GoogleFonts.lato(fontSize: 50, fontWeight: FontWeight.w400);

  static final TextStyle heading4 = GoogleFonts.lato(
      fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25);

  static final TextStyle heading5 =
      GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w400);

  static final TextStyle heading6 = GoogleFonts.lato(
      fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15);

  static final TextStyle button = GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25);

  static final TextStyle bodyText1 = GoogleFonts.lato(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5);

  static final TextStyle captionText = GoogleFonts.lato(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4);
}

class AppColors {
  const AppColors();
  // static final MaterialColor cGreen =
  //     MaterialColor(0xFF1BB7A5, _ColorMaps.cGreenMap);

  // static final MaterialColor cPurple =
  //     MaterialColor(0xFF51006F, _ColorMaps.cPurpleMap);

  static final MaterialColor cLightGrey =
      MaterialColor(0xFFE7E7E7, _ColorMaps.cLightGreyMap);
  static final MaterialColor cDarkGrey =
      MaterialColor(0xFF5D5D5D, _ColorMaps.cDarkGreyMap);
  static final MaterialColor cWhite =
      MaterialColor(0xFFFFFFFF, _ColorMaps.cWhite);

  static final MaterialColor cPurple =
      MaterialColor(0xFF370B64, _ColorMaps.cPurpleMap);
  static final MaterialColor cGreen =
      MaterialColor(0xFF17998a, _ColorMaps.cGreenMap);
}

class _ColorMaps {
  static final Map<int, Color> cWhite = {
    50: Color.fromRGBO(255, 255, 255, 0.1),
    100: Color.fromRGBO(255, 255, 255, 0.2),
    200: Color.fromRGBO(255, 255, 255, 0.3),
    300: Color.fromRGBO(255, 255, 255, 0.4),
    400: Color.fromRGBO(255, 255, 255, 0.5),
    500: Color.fromRGBO(255, 255, 255, 0.6),
    600: Color.fromRGBO(255, 255, 255, 0.7),
    700: Color.fromRGBO(255, 255, 255, 0.8),
    800: Color.fromRGBO(255, 255, 255, 0.9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };

  // static final Map<int, Color> cGreenMap = {
  //   50: Color.fromRGBO(27, 183, 165, 0.1),
  //   100: Color.fromRGBO(27, 183, 165, 0.2),
  //   200: Color.fromRGBO(27, 183, 165, 0.3),
  //   300: Color.fromRGBO(27, 183, 165, 0.4),
  //   400: Color.fromRGBO(27, 183, 165, 0.5),
  //   500: Color.fromRGBO(27, 183, 165, 0.6),
  //   600: Color.fromRGBO(27, 183, 165, 0.7),
  //   700: Color.fromRGBO(27, 183, 165, 0.8),
  //   800: Color.fromRGBO(27, 183, 165, 0.9),
  //   900: Color.fromRGBO(27, 183, 165, 1),
  // };

  // static final Map<int, Color> cPurpleMap = {
  //   50: Color.fromRGBO(81, 0, 111, 0.1),
  //   100: Color.fromRGBO(81, 0, 111, 0.2),
  //   200: Color.fromRGBO(81, 0, 111, 0.3),
  //   300: Color.fromRGBO(81, 0, 111, 0.4),
  //   400: Color.fromRGBO(81, 0, 111, 0.5),
  //   500: Color.fromRGBO(81, 0, 111, 0.6),
  //   600: Color.fromRGBO(81, 0, 111, 0.7),
  //   700: Color.fromRGBO(81, 0, 111, 0.8),
  //   800: Color.fromRGBO(81, 0, 111, 0.9),
  //   900: Color.fromRGBO(81, 0, 111, 1),
  // };

  static final Map<int, Color> cLightGreyMap = {
    50: Color.fromRGBO(231, 231, 231, 0.1),
    100: Color.fromRGBO(231, 231, 231, 0.2),
    200: Color.fromRGBO(231, 231, 231, 0.3),
    300: Color.fromRGBO(231, 231, 231, 0.4),
    400: Color.fromRGBO(231, 231, 231, 0.5),
    500: Color.fromRGBO(231, 231, 231, 0.6),
    600: Color.fromRGBO(231, 231, 231, 0.7),
    700: Color.fromRGBO(231, 231, 231, 0.8),
    800: Color.fromRGBO(231, 231, 231, 0.9),
    900: Color.fromRGBO(231, 231, 231, 1),
  };
  static final Map<int, Color> cDarkGreyMap = {
    50: Color.fromRGBO(93, 93, 93, 0.1),
    100: Color.fromRGBO(93, 93, 93, 0.2),
    200: Color.fromRGBO(93, 93, 93, 0.3),
    300: Color.fromRGBO(93, 93, 93, 0.4),
    400: Color.fromRGBO(93, 93, 93, 0.5),
    500: Color.fromRGBO(93, 93, 93, 0.6),
    600: Color.fromRGBO(93, 93, 93, 0.7),
    700: Color.fromRGBO(93, 93, 93, 0.8),
    800: Color.fromRGBO(93, 93, 93, 0.9),
    900: Color.fromRGBO(93, 93, 93, 1),
  };

  // This is just a precaution if the colors aren't looking good

  static final Map<int, Color> cPurpleMap = {
    50: Color.fromRGBO(55, 11, 100, 0.1),
    100: Color.fromRGBO(55, 11, 100, 0.2),
    200: Color.fromRGBO(55, 11, 100, 0.3),
    300: Color.fromRGBO(55, 11, 100, 0.4),
    400: Color.fromRGBO(55, 11, 100, 0.5),
    500: Color.fromRGBO(55, 11, 100, 0.6),
    600: Color.fromRGBO(55, 11, 100, 0.7),
    700: Color.fromRGBO(55, 11, 100, 0.8),
    800: Color.fromRGBO(55, 11, 100, 0.9),
    900: Color.fromRGBO(55, 11, 100, 1),
  };

  static final Map<int, Color> cGreenMap = {
    50: Color.fromRGBO(23, 153, 138, 0.1),
    100: Color.fromRGBO(23, 153, 138, 0.2),
    200: Color.fromRGBO(23, 153, 138, 0.3),
    300: Color.fromRGBO(23, 153, 138, 0.4),
    400: Color.fromRGBO(23, 153, 138, 0.5),
    500: Color.fromRGBO(23, 153, 138, 0.6),
    600: Color.fromRGBO(23, 153, 138, 0.7),
    700: Color.fromRGBO(23, 153, 138, 0.8),
    800: Color.fromRGBO(23, 153, 138, 0.9),
    900: Color.fromRGBO(23, 153, 138, 1),
  };
}
