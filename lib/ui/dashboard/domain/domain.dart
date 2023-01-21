import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/ui/global_components/bottom_nav_widget.dart';
import 'package:tiktok_flutter/ui/profile/profile_screen.dart';

import '../home/home_page.dart';

class Domain extends StatefulWidget {
  const Domain({Key? key}) : super(key: key);

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  Widget bottomPages({required int index}) {
    final bottomPages = [
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
      ProfileScreen()
    ];
    return bottomPages[index];
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
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  body: Stack(
                    children: [
                      bottomPages(index: index),
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
