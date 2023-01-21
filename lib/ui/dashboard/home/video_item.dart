import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';
import 'package:tiktok_flutter/ui/dashboard/home/actions_toolbar.dart';
import 'package:cached_video_player/cached_video_player.dart';

import 'side_colum_item.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        video.controller != null
            ? GestureDetector(
                onTap: () {
                  video.controller!.value.isPlaying
                      ? video.controller?.pause()
                      : video.controller?.play();
                },
                child: SizedBox.expand(
                    child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: video.controller?.value.size.width ?? 0,
                    height: video.controller?.value.size.height ?? 0,
                    child: CachedVideoPlayer(video.controller!),
                  ),
                )),
              )
            : Container(
                color: Colors.black,
                width: video.controller?.value.size.width ?? 0,
                height: video.controller?.value.size.height ?? 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CupertinoActivityIndicator(color: Colors.white),
                        const SizedBox(width: 10),
                        Text('Loading...',
                            style: GlobalTextStyles.regularText(
                                color: Colors.white))
                      ],
                    ),
                  ],
                ),
              ),
        Positioned(
            left: 4.heightAdjusted,
            bottom: 25.heightAdjusted,
            child:
                VideoDescription(video.user, video.videoTitle, video.songName)),
        Positioned(
            right: 4.heightAdjusted,
            top: 25.heightAdjusted,
            child: ActionsToolbar(
                video.likes,
                video.comments,
                "https://www.andersonsobelcosmetic.com"
                "/wp-content/uploads/2018/09/chin-implant-vs"
                "-fillers-best-for-improving-profile-bellevue"
                "-washington-chin-surgery.jpg")),
      ],
    );
  }
}
