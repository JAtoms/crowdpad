import 'package:flutter/material.dart';
import 'size_config.dart';

enum Margin { horizontal, vertical, all }

EdgeInsetsGeometry globalMargin({required Margin margin}) {
  if (margin == Margin.all) {
    return EdgeInsets.all(4.heightAdjusted);
  } else if (margin == Margin.horizontal) {
    return EdgeInsets.symmetric(horizontal: 4.heightAdjusted);
  } else {
    return EdgeInsets.symmetric(vertical: 4.heightAdjusted);
  }
}
