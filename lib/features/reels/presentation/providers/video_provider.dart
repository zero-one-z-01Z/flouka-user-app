import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/core/helper_function/helper_function.dart';
import 'package:flouka/core/models/pagination_class.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';
import 'package:flouka/features/reels/domain/use_case/reel_use_case.dart';
import 'package:flouka/features/reels/presentation/models/reel_item.dart';
import 'package:flouka/features/reels/presentation/views/videos_home_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/helper_function/navigation.dart';
import '../../../../flouka_app.dart';

class VideoProvider extends ChangeNotifier
    with RouteAware
    implements PaginationClass {
  final ReelUseCase reelUseCase;
  VideoProvider(this.reelUseCase);

  PageController controller = PageController();

  int currentPage = 0;
  int previousNextPage = 0;

  void startListen() {
    currentPage = 0;
    controller.removeListener(() {});
    delay(400);
    controller.addListener(() {
      if (controller.page == controller.page!.roundToDouble()) {
        int currentPage = controller.page!.toInt();
        this.currentPage = currentPage;
        if (reelItems != null && reelItems!.isNotEmpty) {
          playVideo(reelItems![currentPage]);
          if (currentPage == reelItems!.length - 9) {
            if (!paginationFinished && !paginationStarted) {
              paginationStarted = true;
              notifyListeners();
              getReels();
            }
          }
        }
      }
    });
  }

  void stopCurrentVideo(ReelItem item) {
    if (item.controller != null && item.controller!.value.isInitialized) {
      item.controller!.pause();
      item.controller!.seekTo(Duration.zero);
    }
    // notifyListeners();
  }

  void playVideo(ReelItem item) {
    if (item.controller != null && item.controller!.value.isInitialized) {
      item.controller!.play();
    }
    notifyListeners();
  }

  void goToVideosPage() {
    if (reelItems != null && reelItems!.isNotEmpty) {
      controller = PageController(initialPage: currentPage);
      playVideo(reelItems![currentPage]);
      startListen();
    }
    navP(const VideosHomePage());
  }

  /// RouteAware Callbacks
  @override
  void didPushNext() {
    // Called when another route is pushed on top
    pauseCurrentVideo();
  }

  @override
  void didPopNext() {
    // Called when returning to this route
    if (reelItems != null && reelItems!.isNotEmpty) {
      playVideo(reelItems![currentPage]);
    }
  }

  @override
  void didPush() {
    // Route was pushed into view
    startListen();
  }

  @override
  void didPop() {
    // Route was popped
    pauseCurrentVideo();
  }

  void pauseCurrentVideo() {
    if (reelItems != null &&
        reelItems!.isNotEmpty &&
        reelItems![currentPage].controller != null) {
      reelItems![currentPage].controller?.pause();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    controller.dispose();
    super.dispose();
  }

  bool categories = false;
  bool subCategories = false;
  bool adLocation = false;

  List<ReelItem>? reelItems;
  ReelItem? currentReelItem;
  int? videoId;

  void rebuild() {
    notifyListeners();
  }

  void setVideoId(int id) {
    videoId = id;
  }

  void clear() {
    reelItems = null;
    paginationStarted = false;
    paginationFinished = false;
    categories = false;
    subCategories = false;
    adLocation = false;
    pageIndex = 1;
    notifyListeners();
  }

  Future refresh() async {
    clear();
    getReels();
  }

  Future getReels() async {
    Either<DioException, List<ReelEntity>> value = await reelUseCase.getReels();
    value.fold(
      (l) {
        showToast(l.message ?? "");
      },
      (r) {
        pageIndex++;
        reelItems ??= [];
        for (var element in r) {
          VideoPlayerController controller = VideoPlayerController.networkUrl(
            Uri.parse(element.path),
          );
          Future<void> initializeFuture = controller.initialize().then((_) {
            controller.setLooping(true);
            // Auto-play first video if list was empty
            if (reelItems!.length == 1 && currentPage == 0) {
              controller.play();
            }
            notifyListeners();
          });
          reelItems?.add(
            ReelItem(
              reel: element,
              controller: controller,
              initializeFuture: initializeFuture,
            ),
          );
        }
        if (r.isEmpty) {
          paginationFinished = true;
        }
      },
    );
    paginationStarted = false;
    notifyListeners();
  }

  bool showSlider = false;

  void showVideoSlider() async {
    showSlider = true;
    notifyListeners();
    await delay(3000);
    showSlider = false;
    notifyListeners();
  }

  String durationVideo({required int num}) {
    if (num < 10) {
      return "0$num";
    } else {
      return "$num";
    }
  }

  // CategoryEntity? categoryEntity; // Removed unused or missing entity

  bool selected = false;

  Future getInVideos() async {
    if (selected) {
      clear();
      getReels();
      selected = false;
    }
  }

  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }

  void changePageViewIndex(int index) {
    previousNextPage = index;
  }

  // Future increaseShare() async {
  //     Implement increaseShare in ReelUseCase
  //   // Map<String, dynamic> data = {};
  //   // data['video_id'] = videoId;
  //   // Either<DioException, bool> value = await VideoUseCases(sl()).increaseShare(data);
  //   // value.fold((l) {
  //   //   showToast(l.message!);
  //   // }, (r) {});
  //   // notifyListeners();
  // }

  bool listNotEmpty() {
    return reelItems != null && reelItems!.isNotEmpty;
  }

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  void pagination() {
    controller.addListener(() async {
      if (controller.position.atEdge && controller.position.pixels > 50) {
        if (!paginationFinished && !paginationStarted && reelItems != null) {
          paginationStarted = true;
          notifyListeners();
          await getReels();
        }
      }
    });
  }
}
