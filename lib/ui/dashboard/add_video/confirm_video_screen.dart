import 'dart:io';

import 'package:crowdpad/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:crowdpad/helpers/text_styles.dart';
import 'package:crowdpad/index_exports.dart';
import 'package:crowdpad/ui/global_components/global_button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../global_components/bottom_nav_widget.dart';
import '../../global_components/global_form_fieldB.dart';

class CrowdPadVideoPlayer extends StatefulWidget {
  final File videoPath;

  const CrowdPadVideoPlayer({Key? key, required this.videoPath})
      : super(key: key);

  @override
  State<CrowdPadVideoPlayer> createState() => _CrowdPadVideoPlayerState();
}

class _CrowdPadVideoPlayerState extends State<CrowdPadVideoPlayer> {
  late VideoPlayerController _controller;
  final GlobalKey<FormState> formKey = GlobalKey();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().showBottomBar(false);
    setState(() {
      _controller = VideoPlayerController.file(widget.videoPath);
    });
    _controller.initialize();
    _controller.play();
    _controller.setVolume(1);
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  void chooseAnotherVideo() {
    context.read<DashboardCubit>().chooseAnotherVideo().then((value) {
      if (value != null) {
        setState(() {
          _controller = VideoPlayerController.file(value);
          _controller
            ..initialize()
            ..play()
            ..setVolume(1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: VideoPlayer(_controller)),
        Positioned(
            right: 4.heightAdjusted,
            top: 10.heightAdjusted,
            height: 7.heightAdjusted,
            width: 7.heightAdjusted,
            child: GestureDetector(
              onTap: () {
                if (_controller.value.isPlaying) {
                  context.read<DashboardCubit>().resetState();
                  _controller.pause();
                } else {
                  context.read<DashboardCubit>().resetState();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: GlobalColors.primary, shape: BoxShape.circle),
                child: Icon(Icons.cancel_rounded,
                    color: Colors.white, size: 8.heightAdjusted),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.heightAdjusted),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GlobalFormFieldB(
                    fieldName: 'Add title ...',
                    keyBoardType: TextInputType.text,
                    textController: titleController),
                SizedBox(height: 4.heightAdjusted),
                GlobalFormFieldB(
                    fieldName: 'Add description ...',
                    keyBoardType: TextInputType.multiline,
                    maxLines: 5,
                    textController: descriptionController),
                SizedBox(height: 4.heightAdjusted),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: GlobalColors.primary,
                      borderRadius: BorderRadius.circular(10.heightAdjusted)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => chooseAnotherVideo(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.heightAdjusted,
                              vertical: 4.heightAdjusted),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(10.heightAdjusted)),
                          child: Text('Chose another video',
                              style: GlobalTextStyles.semiBold(
                                  color: Colors.black54)),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context
                              .read<DashboardCubit>()
                              .uploadVideo(
                                  context: context,
                                  title: titleController.text,
                                  description: descriptionController.text),
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.heightAdjusted,
                                  vertical: 2.heightAdjusted),
                              child: Text('Upload',
                                  style: GlobalTextStyles.semiBold(
                                      color: Colors.white))),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 4.heightAdjusted)
              ],
            ),
          ),
        )
      ],
    );
  }
}
