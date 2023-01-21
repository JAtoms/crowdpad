import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';

import 'for_you_widget.dart';
import 'video_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        print(state.videoList.length);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              PageView.builder(
                controller: PageController(initialPage: 0, viewportFraction: 1),
                itemCount: state.videoList.length,
                onPageChanged: (index) {
                  index = index % (state.videoList.length);
                  context.read<DashboardCubit>().changeVideo(index);
                },
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  index = index % (state.videoList.length);
                  return VideoItem(video: state.videoList[index]);
                },
              ),
              ForYouWidget(),
            ],
          ),
        );
      },
    );
  }
}
