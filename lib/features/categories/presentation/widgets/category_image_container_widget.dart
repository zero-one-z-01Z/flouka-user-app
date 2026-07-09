import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryImageContainerWidget extends StatelessWidget {
  const CategoryImageContainerWidget({super.key, required this.category});
  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 45.w,
          height: 15.h,
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: category.image??"",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        // SizedBox(height: 1.h),
        Text(
          category.name,
          style: TextStyleClass.normalStyle().copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
