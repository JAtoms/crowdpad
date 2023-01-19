import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextStyles {
  static TextStyle regularText({Color? color, double fontSize = 16}) {
    return GoogleFonts.nunito(color: color, fontSize: fontSize);
  }

  static TextStyle medium({Color? color, double fontSize = 16}) {
    return GoogleFonts.nunito(
        color: color, fontWeight: FontWeight.w600, fontSize: fontSize);
  }

  static TextStyle bold({Color? color, double fontSize = 16}) {
    return GoogleFonts.nunito(
        color: color, fontWeight: FontWeight.bold, fontSize: fontSize);
  }

  static TextStyle title(
      {Color? color, Paint? foreground, double fontSize = 60}) {
    return GoogleFonts.nunito(
        color: color,
        fontWeight: FontWeight.bold,
        foreground: foreground,
        fontSize: fontSize);
  }
}
