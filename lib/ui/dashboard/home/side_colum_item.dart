import 'package:flutter/material.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/helpers/text_styles.dart';

class VideoDescription extends StatelessWidget {
  final username;
  final videoTitle;
  final songInfo;

  VideoDescription(this.username, this.videoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '@' + username,
            style:
                GlobalTextStyles.regularText(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 7),
          Text(
            videoTitle,
            style:
                GlobalTextStyles.regularText(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 7),
          Row(children: [
            Icon(Icons.music_note, size: 15.0, color: Colors.white),
            Text(
              songInfo,
              style: GlobalTextStyles.regularText(
                  fontSize: 14, color: Colors.white),
            )
          ]),
        ]);
  }
}
