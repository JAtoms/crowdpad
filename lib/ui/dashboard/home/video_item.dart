import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/helpers/size_config.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';
import 'package:tiktok_flutter/ui/dashboard/home/actions_toolbar.dart';
import 'package:cached_video_player/cached_video_player.dart';

import 'side_colum_item.dart';

class VideoItem extends StatefulWidget {
  const VideoItem({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.video.controller != null
            ? GestureDetector(
                onTap: () {
                  widget.video.controller!.value.isPlaying
                      ? widget.video.controller?.pause()
                      : widget.video.controller?.play();
                },
                child: SizedBox.expand(
                    child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: widget.video.controller?.value.size.width ?? 0,
                    height: widget.video.controller?.value.size.height ?? 0,
                    child: CachedVideoPlayer(widget.video.controller!),
                  ),
                )),
              )
            : Container(
                color: Colors.black,
                width: widget.video.controller?.value.size.width ?? 0,
                height: widget.video.controller?.value.size.height ?? 0,
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
            child: VideoDescription(widget.video.user, widget.video.videoTitle,
                widget.video.songName)),
        Positioned(
            right: 4.heightAdjusted,
            top: 25.heightAdjusted,
            child: ActionsToolbar(
                widget.video.likes,
                widget.video.comments,
                "https://www.andersonsobelcosmetic.com"
                "/wp-content/uploads/2018/09/chin-implant-vs"
                "-fillers-best-for-improving-profile-bellevue"
                "-washington-chin-surgery.jpg")),
      ],
    );
  }
}
