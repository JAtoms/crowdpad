import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {Key? key,
      required this.btnText,
      this.onTap,
      this.height,
      this.width,
      this.color})
      : super(key: key);

  final String btnText;
  final Color? color;

  final Function()? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? SizeConfig.heightAdjusted(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? GlobalColors.primary,
            borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(10))),
        child:
            Text(btnText, style: GlobalTextStyles.medium(color: Colors.white)),
      ),
    );
  }
}
