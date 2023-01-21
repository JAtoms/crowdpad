import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/widgets/actions_toolbar.dart';
import 'package:tiktok_flutter/widgets/video_description.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DashboardCubit>().getVideos();
    super.initState();
  }

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
                  return videoCard(state.videoList[index]);
                },
              ),
              // SafeArea(
              //   child: Container(
              //     padding: EdgeInsets.only(top: 20),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: <Widget>[
              //           Text('Following',
              //               style: TextStyle(
              //                   fontSize: 17.0,
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.white70)),
              //           SizedBox(
              //             width: 7,
              //           ),
              //           Container(
              //             color: Colors.white70,
              //             height: 10,
              //             width: 1.0,
              //           ),
              //           SizedBox(
              //             width: 7,
              //           ),
              //           Text('For You',
              //               style: TextStyle(
              //                   fontSize: 17.0,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white))
              //         ]),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget videoCard(Video video) {
    return Stack(
      children: [
        video.controller != null
            ? GestureDetector(
                onTap: () {
                  if (video.controller!.value.isPlaying) {
                    video.controller?.pause();
                  } else {
                    video.controller?.play();
                  }
                },
                child: SizedBox.expand(
                    child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: video.controller?.value.size.width ?? 0,
                    height: video.controller?.value.size.height ?? 0,
                    child: VideoPlayer(video.controller!),
                  ),
                )),
              )
            : Container(
                color: Colors.black,
                child: Center(
                  child: Text("Loading"),
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(video.user, video.videoTitle, video.songName),
                ActionsToolbar(video.likes, video.comments,
                    "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    );
  }
}
