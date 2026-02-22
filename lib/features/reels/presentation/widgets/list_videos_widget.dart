import 'package:flouka/core/dialog/guest_dialog.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/reels/presentation/models/reel_item.dart';
import 'package:flouka/features/reels/presentation/providers/video_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../flouka_app.dart';
import 'smooth_video_progress_widget.dart';
import 'user_button_actions.dart';
import 'video_widget.dart';

class ListVideosWidget extends StatelessWidget {
  const ListVideosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    VideoProvider videoProvider = Provider.of(context);
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final ModalRoute? route = ModalRoute.of(context);
          if (route is PageRoute) {
            routeObserver.subscribe(videoProvider, route);
          }
        });
        return Stack(
          children: [
            Builder(
              builder: (context) {
                if (videoProvider.reelItems == null ||
                    videoProvider.reelItems!.isEmpty) {
                  return const SizedBox();
                }
                return PageView(
                  controller: videoProvider.controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  onPageChanged: (val) {
                    videoProvider.stopCurrentVideo(
                      videoProvider.reelItems![videoProvider.previousNextPage],
                    );

                    videoProvider.changePageViewIndex(val);
                    // Assuming all are videos for now
                    videoProvider.playVideo(videoProvider.reelItems![val]);
                  },
                  children: List.generate(videoProvider.reelItems!.length, (index) {
                    ReelItem reelItem = videoProvider.reelItems![index];
                    return InkWell(
                      onDoubleTap: () {
                        AuthProvider auth = Provider.of(context, listen: false);

                        if (!auth.isGuest()) {
                          // AdsProvider adsProvider = Provider.of(context, listen: false);
                          // if (auth.userEntity?.id != reelItem.reel.vendor.id) {
                          //   // adsProvider.changeAdFavouriteState(ad: reelItem.reel);
                          //   Provider.of<VideoProvider>(context, listen: false).rebuild();
                          // }
                        } else {
                          showGuestDialog();
                        }
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: [
                                VideoWidget(reelItem: reelItem, onTap: () {}),
                                // Carousel logic removed for now as ReelEntity is primarily video
                              ],
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0.h,
                            right: 0,
                            child: Column(
                              children: [
                                UserButtonActionsWidget(reelEntity: reelItem.reel),
                                SizedBox(height: 1.h),
                                InkWell(
                                  onTap: () {
                                    // Provider.of<AdsDetailsProvider>(context, listen: false).goToAdsDetailsPage(id: reelItem.reel.id, similar: false);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (reelItem.controller != null)
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    reelItem.toggleMute();
                                                    videoProvider.rebuild();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(2.w),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                    ),
                                                    child: Icon(
                                                      reelItem.isMuted
                                                          ? Icons.volume_off
                                                          : Icons.volume_up,
                                                      size: 6.w,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w,
                                                ),
                                                child: Text(
                                                  reelItem.reel.caption,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyleClass.normalStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(2.w),
                                              decoration: BoxDecoration(
                                                color: AppColor.primaryColor,
                                                borderRadius: BorderRadius.circular(
                                                  2.w,
                                                ),
                                              ),
                                              child: Text(
                                                LanguageProvider.translate(
                                                  "video",
                                                  "details",
                                                ),
                                                style: TextStyleClass.normalStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                if (reelItem.controller != null)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SmoothVideoProgressWidget(
                                          videoPlayerController:
                                              reelItem.controller!,
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  SizedBox(height: 4.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
