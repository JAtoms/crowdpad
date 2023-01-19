import 'dart:io';

import 'package:crowdpad/index_exports.dart';

import '../../dependency/navigation/navigator_routes.dart';

class GlobalBackButton extends StatelessWidget {
  const GlobalBackButton({Key? key, this.widget}) : super(key: key);

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: Platform.isIOS ? 16.heightAdjusted : 10.heightAdjusted),
        child: Row(
          children: [
            InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => globalPop(context: context),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.arrow_back_ios,
                        color: Colors.black, size: 4.5.heightAdjusted))),
            const Spacer(),
            if (widget != null) widget!
          ],
        ),
      ),
    );
  }
}
