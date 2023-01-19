import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdpad/data_models/video.dart';
import 'package:crowdpad/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:crowdpad/helpers/text_styles.dart';
import 'package:crowdpad/ui/dashboard/home_page/video_player_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: context.read<DashboardCubit>().getVideos(),
        builder: (context, snapshot) {
          List<VideoModel> videList = [];
          if (snapshot.hasError) {
            return Text('Something went wrong',
                style: GlobalTextStyles.regularText(color: Colors.white));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CupertinoActivityIndicator(),
                SizedBox(width: 10),
                Text('Loading...')
              ],
            );
          }

          if (snapshot.data != null) {
            final docRef = snapshot.data;
            for (var element in docRef!.docs) {
              videList.add(
                VideoModel.fromSnap(element),
              );
            }
          }

          return snapshot.data != null && snapshot.hasData
              ? Stack(
                  children: [
                    PageView.builder(
                      itemCount: videList.length,
                      controller:
                          PageController(initialPage: 0, viewportFraction: 1),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          VideoPlayerItem(videoUrl: videList[index].videoUrl),
                    )
                  ],
                )
              : Text('No data in database...');
        },
      ),
    );
  }
}
