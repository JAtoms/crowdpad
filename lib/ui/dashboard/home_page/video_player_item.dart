import 'package:cached_video_player/cached_video_player.dart';
import 'package:crowdpad/helpers/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  late CachedVideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = CachedVideoPlayerController.network(widget.videoUrl);
    controller.initialize().then((value) {
      controller.play();
      controller.setVolume(40);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return controller.value.isInitialized
        ? CachedVideoPlayer(controller)
        : Container(
            height: size.height,
            width: size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CupertinoActivityIndicator(color: Colors.white),
                    const SizedBox(width: 10),
                    Text('Loading...',
                        style:
                            GlobalTextStyles.regularText(color: Colors.white))
                  ],
                ),
              ],
            ),
          );
  }
}
