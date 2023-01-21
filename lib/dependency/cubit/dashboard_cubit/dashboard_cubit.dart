import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/fire_api/fire_api.dart';
import 'package:tiktok_flutter/fire_api/fire_apis.dart';
import 'package:tiktok_flutter/helpers/helpers.dart';
import 'package:video_player/video_player.dart';

class DashboardState {
  VideoPlayerController? controller;
  List<Video> videoList = [];
  int prevVideo = 0;
  int actualScreen = 0;
  bool isLoading;
  File? videoPath;

  DashboardState(
      {required this.controller,
      required this.videoList,
      required this.isLoading,
      required this.prevVideo,
      required this.videoPath,
      required this.actualScreen});
}

class DashboardCubit extends Cubit<DashboardState> {
  FireServiceImp fireServiceImp;

  DashboardCubit({required this.fireServiceImp})
      : super(DashboardState(
            controller: null,
            videoList: [],
            prevVideo: 0,
            isLoading: false,
            videoPath: null,
            actualScreen: 0));

  void _emitState() async => emit(DashboardState(
      controller: state.controller,
      videoList: state.videoList,
      prevVideo: state.prevVideo,
      isLoading: state.isLoading,
      videoPath: state.videoPath,
      actualScreen: state.actualScreen));

  getVideos() async {
    await FireApi().getVideoList().then((value) => state.videoList = value);
    loadVideo(2);
    loadVideo(1);
    loadVideo(0);
  }

  changeVideo(index) async {
    if (state.videoList[index].controller == null) {
      await state.videoList[index].loadController();
    }
    state.videoList[index].controller!.play();
    if (state.videoList[state.prevVideo].controller != null)
      state.videoList[state.prevVideo].controller!.pause();

    state.prevVideo = index;

    _emitState();
  }

  void loadVideo(int index) async {
    if (state.videoList.length > index) {
      await state.videoList[index].loadController();
      state.videoList[index].controller?.play();
      _emitState();
    }
  }

  void _setLoading(bool isLoading) async => emit(DashboardState(
      isLoading: isLoading,
      controller: state.controller,
      videoList: state.videoList,
      videoPath: state.videoPath,
      prevVideo: state.prevVideo,
      actualScreen: state.actualScreen));

  void pickVideo() async {
    var video = await videoPicker();
    if (video != null) {
      state.videoPath = File(video.path);
    } else {
      globalToast('Unable to pick video');
    }
    _emitState();
  }

// Future<File?> chooseAnotherVideo() async {
//   var video = await videoPicker();
//   if (video != null) {
//     return state.videoPath = File(video.path);
//   } else {
//     globalToast('Unable to pick video');
//     return null;
//   }
// }

// void uploadMedia() async {
//   var video = await videoPicker();
//
//   if (video != null) {
//     _setLoading(true);
//     fireServiceImp
//         .uploadMedia(image: state.videoPath!)
//         .then((value) => state.fireMedia = value);
//     _setLoading(false);
//   }
//
//   _emitState();
// }

  void uploadVideo({required String title, required String description}) async {
    fireServiceImp.uploadVideo(
        videoFile: state.videoPath!, title: title, description: description);
  }
}
