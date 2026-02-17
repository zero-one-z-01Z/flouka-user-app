import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../domain/entity/category_entity.dart';
import '../providers/popular_categoey_provider.dart';
import 'popular_category_container_widget.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageProvider.translate('home', 'popular_categories'),
                style: TextStyleClass.normalStyle().copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                LanguageProvider.translate('home', 'see_all'),
                style: TextStyleClass.normalStyle().copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffAEB1C1),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 13.h,
          child: Consumer<HomeCategoreyProvider>(
            builder: (context, provider, _) {
              final List<CategoryEntity> popular = provider.popularCategories;

              if (popular.isEmpty && provider.popularCategories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              if (popular.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                itemCount: popular.length,
                itemBuilder: (context, index) {
                  final category = popular[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: PopularCategoryContainerWidget(category: category),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
