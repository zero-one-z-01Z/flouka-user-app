import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';

class UserButtonActionsWidget extends StatelessWidget {
  const UserButtonActionsWidget({super.key, required this.reelEntity});
  final ReelEntity reelEntity;
  @override
  Widget build(BuildContext context) {
    // CommentProvider commentProvider = Provider.of(context, listen: false);
    // AdsDetailsProvider adsDetailsProvider = Provider.of(context, listen: false);
    AuthProvider authProvider = Provider.of(context, listen: false);

    // adsDetailsProvider.adEntity = adEntity;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  onTap: () {
                    // Provider.of<AdsUserProfileProvider>(
                    //   context,
                    //   listen: false,
                    // ).goToAdsUserProfilePage(userId: reelEntity.vendor.id);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    height: 12.w,
                    width: 12.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade400),
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(reelEntity.vendor.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
             
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      // if (!authProvider.isGuest() &&
                      //     authProvider.userEntity?.id != reelEntity.vendor.id) {
                      //   AdsProvider adsProvider = Provider.of(
                      //     context,
                      //     listen: false,
                      //   );
                      //   adsProvider.changeAdFavouriteState(ad: adEntity);
                      // }
                    },
                    // child: FavouriteIconWidget(
                    //   fav: reelEntity.isFavorite,
                    //   color: reelEntity.isFavorite
                    //       ? AppColor.thirdColor
                    //       : Colors.white,
                    //   fill: true,
                    // ),
                    child: const Icon(Icons.favorite_border, color: Colors.white),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "${reelEntity.likesCount}",
                    style: TextStyleClass.normalStyle(color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      // commentProvider.showCommentsDialog(
                      //   context: context,
                      //   adEntity: adEntity,
                      // );
                    },
                    child: SvgWidget(
                      svg: AppImages.explore,
                      width: 6.w,
                      height: 6.w,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "${reelEntity.commentsCount}",
                    style: TextStyleClass.normalStyle(color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      // shareAd(context, adEntity, () {
                      //   adsDetailsProvider.increaseShareCount();
                      // });
                    },
                    child: SvgWidget(
                      svg: AppImages
                          .explore, // Ensure this exists or use standard icon
                      width: 6.w,
                      height: 6.w,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  // Text(
                  //   "${reelEntity.sharesCount}",
                  //   style: TextStyleClass.tinyBoldStyle(color: Colors.white),
                  // ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
