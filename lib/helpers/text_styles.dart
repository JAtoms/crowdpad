import 'package:flutter/material.dart';
import 'size_config.dart';

class GlobalTextStyles {
  static TextStyle formatFigures({Color? color, double fontSize = 16}) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }

  static TextStyle regularText({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Regular',
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }

  static TextStyle medium({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Medium',
        fontWeight: FontWeight.w600,
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }

  static TextStyle semiBold({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Semibold',
        fontWeight: FontWeight.w600,
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }

  static TextStyle bold({Color? color, double fontSize = 16}) {
    return TextStyle(
        color: color,
        fontFamily: 'Bold',
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.textAdjusted(fontSize + 3));
  }
}
