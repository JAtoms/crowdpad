import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';

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
        return Scaffold(
          backgroundColor: Colors.black,
          body: CustomRefreshIndicator(
            onRefresh: () => context.read<DashboardCubit>().getVideos(),
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) => Transform.scale(
                  scale: 3,
                  child: RiveAnimation.asset(
                      'assets/image/809-1634-rocket-demo.riv')),
            ),
            child: Stack(
              children: [
                state.isLoading
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoActivityIndicator(color: Colors.white),
                          SizedBox(width: 2.heightAdjusted),
                          Text('Loading ...',
                              style:
                                  GlobalTextStyles.medium(color: Colors.white)),
                        ],
                      )
                    : PageView.builder(
                        controller:
                            PageController(initialPage: 0, viewportFraction: 1),
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
          ),
        );
      },
    );
  }
}
