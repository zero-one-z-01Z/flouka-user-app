import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/config/app_color.dart';

class SmoothVideoProgressWidget extends StatelessWidget {
  const SmoothVideoProgressWidget({super.key, required this.videoPlayerController});
  final VideoPlayerController videoPlayerController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: VideoProgressIndicator(
          videoPlayerController,
          allowScrubbing: true,
          padding: EdgeInsets.zero,
          colors: VideoProgressColors(
            playedColor: AppColor.primaryColor,
            bufferedColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
