import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdpad/api_service/auth/fire_api.dart';
import 'package:crowdpad/data_models/video.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:crowdpad/ui/global_components/bottom_nav_widget.dart';
import 'package:video_compress/video_compress.dart';
import '../../../index_exports.dart';

class DashboardState {
  bool isLoading, isVisible;
  String fireMedia;
  File? videoPath;
  List<VideoModel> videList;

  DashboardState(
      {required this.isLoading,
      required this.isVisible,
      required this.fireMedia,
      required this.videList,
      required this.videoPath});
}

class DashboardCubit extends Cubit<DashboardState> {
  FireServiceImp fireServiceImp;

  DashboardCubit({required this.fireServiceImp})
      : super(DashboardState(
            isLoading: false,
            isVisible: true,
            videList: [],
            fireMedia: '',
            videoPath: null));

  void _emitState() async => emit(DashboardState(
      isLoading: state.isLoading,
      isVisible: state.isVisible,
      fireMedia: state.fireMedia,
      videList: state.videList,
      videoPath: state.videoPath));

  void _setLoading(bool isLoading) async => emit(DashboardState(
      isLoading: isLoading,
      isVisible: state.isVisible,
      fireMedia: state.fireMedia,
      videList: state.videList,
      videoPath: state.videoPath));

  void resetState() {
    emit(DashboardState(
        isLoading: state.isLoading,
        isVisible: true,
        fireMedia: '',
        videList: [],
        videoPath: null));
    showBottomBar(true);
    pagePosition.value = 0;
  }

  void showBottomBar(bool value) => emit(DashboardState(
      isLoading: state.isLoading,
      isVisible: value,
      fireMedia: state.fireMedia,
      videList: state.videList,
      videoPath: state.videoPath));

  void pickVideo() async {
    var video = await videoPicker();
    if (video != null) {
      state.videoPath = File(video.path);
    } else {
      globalToast('Unable to pick video');
    }
    _emitState();
  }

  Stream<QuerySnapshot> getVideos() => fireServiceImp.getVideos();

  Future<File?> chooseAnotherVideo() async {
    var video = await videoPicker();
    if (video != null) {
      return state.videoPath = File(video.path);
    } else {
      globalToast('Unable to pick video');
      return null;
    }
  }

  void uploadMedia({required BuildContext context}) async {
    var video = await videoPicker();

    if (video != null) {
      _setLoading(true);
      fireServiceImp
          .uploadMedia(image: state.videoPath!)
          .then((value) => state.fireMedia = value);
      _setLoading(false);
    }

    _emitState();
  }

  void uploadVideo(
      {required BuildContext context,
      required String title,
      required String description}) async {
    fireServiceImp.uploadVideo(
        context: context,
        videoFile: state.videoPath!,
        title: title,
        description: description);
  }
}
