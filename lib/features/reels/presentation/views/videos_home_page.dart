import 'package:flouka/core/config/app_theme.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/features/reels/presentation/providers/video_provider.dart';
import 'package:flouka/core/widgets/empty_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../widgets/list_videos_widget.dart';

class VideosHomePage extends StatelessWidget {
  const VideosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    VideoProvider videoProvider = Provider.of(context);
    return AnnotatedRegion(
      value: lightBarColor(),
      child: Scaffold(
        extendBodyBehindAppBar: videoProvider.reelItems != null ? true : false,
        extendBody: videoProvider.reelItems != null ? true : false,
        appBar:
            videoProvider.reelItems != null && videoProvider.reelItems!.isNotEmpty
            ? null
            : AppBar(iconTheme: const IconThemeData(color: Colors.black)),
        body: SafeArea(
          top: false,
          child: RefreshIndicator(
            onRefresh: () async {
              videoProvider.refresh();
            },
            child: Builder(
              builder: (context) {
                if (videoProvider.reelItems == null) {
                  return Center(
                    child: LoadingAnimationWidget(
                      gif: Lotties.videoAnimation,
                      width: 100.w,
                      height: 40.h,
                      topPadding: 0,
                    ),
                  );
                } else if (videoProvider.reelItems!.isEmpty) {
                  return const EmptyAnimation(title: "", gif: Lotties.noSearch);
                }
                return Container(
                  width: 100.w,
                  height: 100.h,
                  color: Colors.black,
                  child: Stack(
                    children: [
                      const ListVideosWidget(),
                      PositionedDirectional(
                        top: 4.h,
                        start: 3.w,
                        child: Container(
                          margin: EdgeInsets.all(1.5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withAlpha((0.3 * 255).round()),
                          ),
                          child: Transform.scale(
                            scale: Constants.isTablet ? 2 : 1,
                            child: BackButton(
                              color: Colors.white,
                              onPressed: () {
                                navPop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
