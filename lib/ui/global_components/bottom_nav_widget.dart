import 'dart:io';

import 'package:crowdpad/index_exports.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/global_assets.dart';

final pagePosition = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: 5.heightAdjusted, vertical: 5.heightAdjusted),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 13,
                  blurRadius: 10,
                  offset: const Offset(0, 2))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 6.heightAdjusted, right: 6.heightAdjusted),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BottomNavItem(index: 0, icon: GlobalAssets.home),
                BottomNavItem(index: 1, icon: GlobalAssets.like),
                BottomNavItem(index: 2, icon: GlobalAssets.add),
                BottomNavItem(index: 3, icon: GlobalAssets.comment),
                BottomNavItem(index: 4, icon: GlobalAssets.profile),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final String icon;
  final int index;

  const BottomNavItem({Key? key, required this.icon, required this.index})
      : super(key: key);

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  void pager({required BuildContext context}) {
    pagePosition.value = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pagePosition,
        builder: (context, int value, child) {
          return GestureDetector(
            onTap: () => pager(context: context),
            child: Container(
              height: Platform.isIOS ? 17.heightAdjusted : 15.heightAdjusted,
              color: Colors.transparent,
              child: SvgPicture.asset(widget.icon,
                  color: widget.index == value
                      ? GlobalColors.primary
                      : Colors.black12,
                  height: widget.index == 2
                      ? 8.heightAdjusted
                      : 4.5.heightAdjusted),
            ),
          );
        });
  }
}
