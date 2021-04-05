import 'package:flutter/material.dart';

class AppFonts {
  const AppFonts();

  static final String _fontfamily = 'lato';

  static final TextStyle heading1 =
      TextStyle(fontSize: 48, fontFamily: _fontfamily);
  static final TextStyle andro =
      TextStyle(fontSize: 15, fontFamily: _fontfamily);
  static final TextStyle heading2 =
      TextStyle(fontSize: 32, fontFamily: _fontfamily);
  static final TextStyle heading3 = TextStyle(
      fontSize: 22, fontFamily: _fontfamily, fontWeight: FontWeight.bold);

  static final TextStyle buttonText =
      TextStyle(fontSize: 24, fontFamily: _fontfamily);
  static final TextStyle smallButtonText =
      TextStyle(fontSize: 18, fontFamily: _fontfamily);

  static final TextStyle appText =
      TextStyle(fontSize: 22, fontFamily: _fontfamily);

  static final TextStyle versionControl =
      TextStyle(fontSize: 15, fontFamily: _fontfamily);
  static final TextStyle captionText =
      TextStyle(fontSize: 13, fontFamily: _fontfamily);
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
