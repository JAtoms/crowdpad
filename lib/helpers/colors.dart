import 'package:flutter/material.dart';

class GlobalColors {
  static Color primaryBlack = const Color(0xff000000);
  static Color primary = const Color(0xff004788);
  static Color textFieldStroke = const Color(0xffbbbbbb);

  static const MaterialColor materialPrimaryColor = MaterialColor(
    0xff325cf4,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff325cf4), //10%
      100: Color(0xff2d53dc), //2ti
      200: Color(0xff284ac3), //30%
      300: Color(0xff2340ab), //40%
      400: Color(0xff1e3792), //50%
      500: Color(0xff192e7a), //60%
      600: Color(0xff142562), //70%
      700: Color(0xff0f1c49), //80%
      800: Color(0xff0a1231), //90%
      900: Color(0xff050918) //100%
    },
  );
}
