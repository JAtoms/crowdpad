import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_flutter/dependency/cubit/upload_cubit/upload_cubit.dart';
import 'package:tiktok_flutter/dependency/navigation/navigator_routes.dart';
import 'package:tiktok_flutter/helpers/colors.dart';
import 'package:tiktok_flutter/helpers/helpers.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';
import 'package:video_player/video_player.dart';

import '../../global_components/global_form_fieldB.dart';

class PreviewScreen extends StatefulWidget {
  final File videoPath;

  const PreviewScreen({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late VideoPlayerController _controller;
  final GlobalKey<FormState> formKey = GlobalKey();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    context.read<UploadVideoCubit>().chooseAnotherVideo().then((value) {
      if (value != null) {
        setState(() {
          _controller = VideoPlayerController.file(value);
          _controller
            ..initialize()
            ..play()
            ..setLooping(true)
            ..setVolume(20);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadVideoCubit, UploadVideoState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
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
                    onTap: () => globalPop(context: context),
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
                  child: Form(
                    key: formKey,
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
                              borderRadius:
                                  BorderRadius.circular(10.heightAdjusted)),
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
                                      borderRadius: BorderRadius.circular(
                                          10.heightAdjusted)),
                                  child: Text('Chose another video',
                                      style: GlobalTextStyles.semiBold(
                                          color: Colors.black54)),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    if (formKey.validate) {
                                      _controller.pause();
                                      context
                                          .read<UploadVideoCubit>()
                                          .uploadVideo(
                                              context: context,
                                              title: titleController.text,
                                              description:
                                                  descriptionController.text);
                                    }
                                  },
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
                ),
              ),
              if (state.isLoading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff333333).withAlpha(100),
                  child: Center(
                    child: Container(
                      width: 50.heightAdjusted,
                      height: 60.heightAdjusted,
                      padding: EdgeInsets.all(4.heightAdjusted),
                      decoration: BoxDecoration(
                          color: Color(0xff333333),
                          borderRadius:
                              BorderRadius.circular(10.heightAdjusted)),
                      child: Column(
                        children: [
                          Lottie.asset('assets/image/lf30_editor_vnofo382.json',
                              height: 40.heightAdjusted),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CupertinoActivityIndicator(color: Colors.white),
                              SizedBox(width: 2.heightAdjusted),
                              Text('Uploading ...',
                                  style: GlobalTextStyles.medium(
                                      color: Colors.white)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
