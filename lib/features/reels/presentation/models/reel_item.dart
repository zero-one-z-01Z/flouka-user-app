import 'package:flouka/features/reels/domain/entity/reel_entity.dart';
import 'package:video_player/video_player.dart';

class ReelItem {
  final ReelEntity reel;
  VideoPlayerController? controller;
  Future<void>? initializeFuture;

  bool isMuted = false;

  ReelItem({required this.reel, this.controller, this.initializeFuture});

  void toggleMute() {
    if (controller != null) {
      if (isMuted) {
        controller!.setVolume(1.0);
        isMuted = false;
      } else {
        controller!.setVolume(0.0);
        isMuted = true;
      }
    }
  }
}
