import 'package:flutter/material.dart';

class GlobalColors {
  static Color primary = const Color(0xff1b75bc);
  static const Color primaryB = Color(0xff29abe2);
  static Color tan = const Color(0xfff0f6fa);
  static Color skyBlue = const Color(0xffd7e6f4);
  static Color yellow = const Color(0xfff9b32e);
  static Color successGreen = const Color(0xff39bd78);
  static Color violet = const Color(0xff5d5fef);
  static Color errorRed = const Color(0xffc30052);
  static Color textFieldStroke = const Color(0xffddf1ff);
  static Color ashWhite = const Color(0xfff0f3f5);
  static Color faintyAsh = const Color(0xffa7a7a8);

  static const MaterialColor materialPrimaryColor = MaterialColor(
    0xff75bcff,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff69a9e6), //10%
      100: Color(0xff5e96cc), //2ti
      200: Color(0xff5284b3), //30%
      300: Color(0xff467199), //40%
      400: Color(0xff3b5e80), //50%
      500: Color(0xff2f4b66), //60%
      600: Color(0xff23384c), //70%
      700: Color(0xff172633), //80%
      800: Color(0xff0c1319), //90%
      900: Color(0xff030a19) //100%
    },
  );
}
