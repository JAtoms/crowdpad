import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/ui/dashboard/profile/profile_screen.dart';
import 'package:tiktok_flutter/ui/global_components/bottom_nav_widget.dart';

import '../home/home_page.dart';
import '../upload_video/upload_video.dart';

var initialPageIndex = ValueNotifier(0);

class Domain extends StatefulWidget {
  const Domain({Key? key}) : super(key: key);

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  Widget bottomPages({required int index}) {
    final bottomPages = [HomePage(), ProfileScreen()];
    if (index == 2) {
      initialPageIndex.value = initialPageIndex.value;
    } else {
      initialPageIndex.value = index;
    }
    return bottomPages[initialPageIndex.value];
  }

  @override
  void initState() {
    context.read<DashboardCubit>().getVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () async => false,
        child: ValueListenableBuilder(
            valueListenable: pagePosition,
            builder: (context, index, child) {
              return Scaffold(
                  backgroundColor: Colors.black,
                  resizeToAvoidBottomInset: false,
                  body: Stack(
                    children: [
                      bottomPages(index: index),
                      if (index == 2) UploadVideo(),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomNavigation())
                    ],
                  ));
            }),
      );
    });
  }
}
