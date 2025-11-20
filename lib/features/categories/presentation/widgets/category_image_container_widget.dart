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
          width: 34.w,
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(category.image),
            ),
          ),
        ),
        SizedBox(height: 1.h),
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
