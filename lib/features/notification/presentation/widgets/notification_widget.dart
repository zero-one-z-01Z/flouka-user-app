import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../domain/entities/notification_entity.dart';
import '../pages/notification_details_page.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationEntity notificationEntity;

  const NotificationWidget({super.key, required this.notificationEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navP(
          NotificationDetailsPage(
            title: notificationEntity.title,
            data: notificationEntity.description,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // If you ever want to use an avatar, uncomment this:
                // CircleAvatar(
                //   radius: 6.w,
                //   backgroundImage: CachedNetworkImageProvider(userImage),
                // ),
                // SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationEntity.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleClass.normalStyle(
                          color: Colors.black,
                        ).copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        notificationEntity.description,
                        style: TextStyleClass.normalStyle(
                          color: Colors.grey,
                        ).copyWith(fontSize: 17.sp),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Divider(color: Colors.grey.shade300, thickness: 0.8),
          ],
        ),
      ),
    );
  }
}
