import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(height: 10.heightAdjusted),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileItem(),
                      GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 0.689),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.heightAdjusted),
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: state.videoList.length,
                          itemBuilder: (context, index) {
                            state.videoList[index].controller!.pause();
                            return GestureDetector(
                              onTap: () {
                                state.videoList[index].controller!.value
                                        .isPlaying
                                    ? state.videoList[index].controller?.pause()
                                    : state.videoList[index].controller?.play();
                              },
                              child: CachedVideoPlayer(
                                  state.videoList[index].controller!),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://q5n8c8q9.rocketcdn.me/wp-content/uploads/"
                    "2018/08/The-20-Best-Royalty-Free-Music-"
                    "Sites-in-2018.png",
                height: 100.0,
                width: 100.0,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("@salvadordev",
            style: GlobalTextStyles.medium(color: Colors.white)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("36", style: GlobalTextStyles.bold(color: Colors.white)),
                SizedBox(
                  height: 5,
                ),
                Text("Following",
                    style: GlobalTextStyles.regularText(color: Colors.white)),
              ],
            ),
            Container(
              color: Colors.black54,
              width: 1,
              height: 15,
              margin: EdgeInsets.symmetric(horizontal: 15),
            ),
            Column(
              children: [
                Text("13", style: GlobalTextStyles.bold(color: Colors.white)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Followers",
                  style: GlobalTextStyles.regularText(color: Colors.white),
                ),
              ],
            ),
            Container(
              color: Colors.black54,
              width: 1,
              height: 15,
              margin: EdgeInsets.symmetric(horizontal: 15),
            ),
            Column(
              children: [
                Text("143", style: GlobalTextStyles.bold(color: Colors.white)),
                SizedBox(height: 5),
                Text("Likes",
                    style: GlobalTextStyles.regularText(color: Colors.white)),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 47,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Center(
                child: Text("Edit profile",
                    style: GlobalTextStyles.bold(color: Colors.white)),
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 45,
              height: 47,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Center(child: Icon(Icons.bookmark, color: Colors.white)),
            )
          ],
        ),
        SizedBox(height: 25),
        Container(
          height: 45,
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  SizedBox(height: 7),
                  Container(color: Colors.black, height: 2, width: 55)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_border, color: Colors.white),
                  SizedBox(height: 7),
                  Container(color: Colors.transparent, height: 2, width: 55)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.lock_outline, color: Colors.white),
                  SizedBox(height: 7),
                  Container(color: Colors.transparent, height: 2, width: 55)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
