import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalOutlineButton extends StatelessWidget {
  const GlobalOutlineButton(
      {Key? key, required this.btnText, required this.onTap})
      : super(key: key);

  final String btnText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: SizeConfig.heightAdjusted(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(180),
            border: Border.all(color: GlobalColors.primary),
            borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(10))),
        child: Text(btnText,
            style: GlobalTextStyles.medium(color: GlobalColors.primary)),
      ),
    );
  }
}
