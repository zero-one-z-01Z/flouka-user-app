import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entity/category_entity.dart';
import '../providers/categories_provider.dart';
import 'category_home_container_widget.dart';

class CategoriesHomeExplore extends StatelessWidget {
  const CategoriesHomeExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      child: Consumer<CategoryProvider>(
        builder: (context, provider, _) {
          final List<CategoryEntity> categories = provider.categories;

          if (categories.isEmpty && provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: CategoryHomeContainerWidget(
                    imageUrl: Images.explore,
                    categoryName: LanguageProvider.translate('home', 'explore'),
                    isSvg: true,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.primaryColor,
                  ),
                );
              }

              final category = categories[index - 1];

              return Padding(
                padding: EdgeInsets.zero,
                child: CategoryHomeContainerWidget(
                  imageUrl: category.image,
                  categoryName: category.name,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
