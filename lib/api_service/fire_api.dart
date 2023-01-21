import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_flutter/data/demo_data.dart';
import 'package:tiktok_flutter/data/video.dart';

class FireApi {
  Future<List<Video>> getVideoList() async {
    var data = await FirebaseFirestore.instance.collection("videos").get();

    var videoList = <Video>[];
    var videos;

    data.docs.length == 0 ? videos = await addDemoData() : videos = data;

    videos.docs.forEach((element) {
      Video video = Video.fromJson(element.data());
      videoList.add(video);
    });

    return videoList;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> addDemoData() async {
    for (var video in data) {
      await FirebaseFirestore.instance.collection("videos").add(video);
    }
    return await FirebaseFirestore.instance.collection("videos").get();
  }
}

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tiktok_flutter/data/demo_data.dart';
// import 'package:tiktok_flutter/data/video.dart';
//
// class VideosAPI {
//   List<Video> listVideos = <Video>[];
//
//   VideosAPI() {
//     load();
//   }
//
//   void load() async => listVideos = await _getVideoList();
//
//   Future<List<Video>> _getVideoList() async {
//     var data = await FirebaseFirestore.instance.collection("videos").get();
//
//     var videoList = <Video>[];
//     var videos;
//
//     data.docs.length == 0 ? videos = await addDemoData() : videos = data;
//
//     videos.docs.forEach((element) {
//       Video video = Video.fromJson(element.data());
//       videoList.add(video);
//     });
//
//     return videoList;
//   }
//
//   Future<QuerySnapshot<Map<String, dynamic>>> addDemoData() async {
//     for (var video in data) {
//       await FirebaseFirestore.instance.collection("videos").add(video);
//     }
//     return await FirebaseFirestore.instance.collection("videos").get();
//   }
// }
