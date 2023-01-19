import 'package:carousel_slider/carousel_slider.dart';
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
  // List<VideoModel> videList = [];
  List<String> videList = [
    'https://media.gettyimages.com/id/1329606489/video/woman-dancing-brazilian-funk.mp4?s=mp4-640x640-gi&k=20&c=JLDMNtJ--00V0dEYKbrM5kIM1LnvdCdIWPRexnwEZTY=',
    'https://media.gettyimages.com/id/1329606489/video/woman-dancing-brazilian-funk.mp4?s=mp4-640x640-gi&k=20&c=JLDMNtJ--00V0dEYKbrM5kIM1LnvdCdIWPRexnwEZTY=',
    'https://media.gettyimages.com/id/1347952689/video/couple-filming-her-trip-on-eco-tourism.mp4?s=mp4-640x640-gi&k=20&c=IQYNRVJJfZLr8KwpVQGsTod1sxN4FE-HkGV3ZRVt32U=',
    'https://media.gettyimages.com/id/1326844953/video/vertical-shot-of-a-road-cyclist-view-on-a-road-near-a-lake.mp4?s=mp4-640x640-gi&k=20&c=_BZuru8jvbXq_U-qhoW-F1NFhVIx84xNQl0EjHn21DE=',
    'https://media.gettyimages.com/id/1347953721/video/couple-filming-riding-amusement-park-ride.mp4?s=mp4-640x640-gi&k=20&c=fHeiNp4CyjVXzqg4FuL2Yg1TrFwlXGZR3QkrmweQTBI=',
    'https://media.gettyimages.com/id/1419810896/video/clouds-in-the-sky-through-plane-window.mp4?s=mp4-640x640-gi&k=20&c=WLBILruFcTUoxMiiMKo7cek-HfFqJcmO53C6LBYD2FM=',
    'https://media.gettyimages.com/id/1221901489/video/mid-adult-man-celebrating-birthday-alone-and-doing-a-video-call-at-home.mp4?s=mp4-640x640-gi&k=20&c=2-_Cwpd0CiPEIwux3OAN7yHg1fjPfhj8E0cBB06EQPI=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: context.read<DashboardCubit>().getVideos(),
        builder: (context, snapshot) {
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
              // videList.add(
              //   VideoModel.fromSnap(element),
              // );
            }
          }

          return snapshot.data != null && snapshot.hasData
              ? Stack(
                  children: [
                    // PageView.builder(
                    //   itemCount: videList.length,
                    //   controller:
                    //       PageController(initialPage: 0, viewportFraction: 1),
                    //   scrollDirection: Axis.vertical,
                    //   itemBuilder: (context, index) =>
                    //       VideoPlayerItem(videoUrl: videList[index]),
                    // )

                    CarouselSlider(
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: double.infinity,
                          scrollDirection: Axis.vertical,
                          viewportFraction: 1.0),
                      items: videList.map((videoModel) {
                        return Builder(
                          builder: (BuildContext context) =>
                              VideoPlayerItem(videoUrl: videoModel),
                        );
                      }).toList(),
                    )
                  ],
                )
              : Text('No data in database...');
        },
      ),
    );
  }
}
