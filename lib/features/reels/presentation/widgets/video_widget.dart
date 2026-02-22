import 'package:flouka/features/reels/presentation/models/reel_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constants/constants.dart';

class VideoWidget extends StatefulWidget {
  final ReelItem reelItem;
  final VoidCallback onTap;

  const VideoWidget({super.key, required this.onTap, required this.reelItem});

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.reelItem.controller != null) {
        if (widget.reelItem.controller!.value.isInitialized == false) {
          widget.reelItem.initializeFuture!.then((value) {
            if (widget.reelItem.controller != null && mounted) {
              widget.reelItem.controller!.play();
            }
          });
        } else {
          widget.reelItem.controller!.play();
        }
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Constants.routeObserver.subscribe(
      this,
      ModalRoute.of(context) as PageRoute,
    ); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPopNext() {
    widget.reelItem.controller?.play();
    super.didPopNext();
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  void didPushNext() {
    widget.reelItem.controller?.pause();
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.reelItem.initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.reelItem.controller!.value.isPlaying
                    ? widget.reelItem.controller?.pause()
                    : widget.reelItem.controller?.play();
                widget.onTap();
              });
            },
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: widget.reelItem.controller?.value.size.width ?? 0,
                  height: widget.reelItem.controller?.value.size.height ?? 0,
                  child: VideoPlayer(widget.reelItem.controller!),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    Constants.routeObserver.unsubscribe(this);
    super.dispose();
  }
}
