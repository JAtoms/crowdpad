import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/api_service/fire_apis.dart';
import 'package:tiktok_flutter/dependency/navigation/global_router_exports.dart';
import 'package:tiktok_flutter/dependency/navigation/navigator_routes.dart';
import 'package:tiktok_flutter/helpers/helpers.dart';
import 'package:tiktok_flutter/ui/global_components/bottom_nav_widget.dart';

class UploadVideoState {
  bool isLoading;
  File? videoPath;

  UploadVideoState({required this.isLoading, required this.videoPath});
}

class UploadVideoCubit extends Cubit<UploadVideoState> {
  FireServiceImp fireServiceImp;

  UploadVideoCubit({required this.fireServiceImp})
      : super(UploadVideoState(isLoading: false, videoPath: null));

  void _emitState() async => emit(
      UploadVideoState(isLoading: state.isLoading, videoPath: state.videoPath));

  void resetState() {
    emit(UploadVideoState(isLoading: false, videoPath: null));

    pagePosition.value = 0;
  }

  void pickVideo() async {
    var video = await videoPicker();
    if (video != null) {
      state.videoPath = File(video.path);
      globalNavigateTo(route: Routes.previewScreen, arguments: state.videoPath);
      pagePosition.value = 0;
    } else {
      globalToast('Unable to pick video');
    }
    _emitState();
  }

  void recordVideo() async {
    var video = await videoRecorder();
    if (video != null) {
      state.videoPath = File(video.path);
      globalNavigateTo(route: Routes.previewScreen, arguments: state.videoPath);
      pagePosition.value = 0;
    } else {
      globalToast('Unable to record video');
    }
    _emitState();
  }

  Future<File?> chooseAnotherVideo() async {
    var video = await videoPicker();
    if (video != null) {
      return state.videoPath = File(video.path);
    } else {
      globalToast('Unable to pick video');
      return null;
    }
  }

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

  void uploadVideo({
    required String title,
    required String description,
    required BuildContext context,
  }) async {
    state.isLoading = true;
    _emitState();
    fireServiceImp
        .uploadVideo(
            videoFile: state.videoPath!,
            context: context,
            title: title,
            description: description)
        .then((value) {
      state.isLoading = false;
      _emitState();
    });
  }
}
