import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entity/category_entity.dart';

class PopularCategoryContainerWidget extends StatelessWidget {
  const PopularCategoryContainerWidget({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 49.w,
      height: 12.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: category.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColor.primaryColor.withOpacity(0.4),
                    AppColor.primaryColor.withOpacity(0.2),
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            // Title text on top
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  category.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
