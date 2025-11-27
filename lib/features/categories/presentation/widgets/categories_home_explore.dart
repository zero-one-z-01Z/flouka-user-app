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
  const CategoriesHomeExplore({super.key, this.showExplore = true});

  final bool showExplore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      child: Consumer<CategoryProvider>(
        builder: (context, provider, _) {
          final List<CategoryEntity> categories = provider.categories;

          if (categories.isEmpty && provider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final itemCount = showExplore
              ? categories.length + 1
              : categories.length;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (showExplore && index == 0) {
                final exploreCategory = CategoryEntity(
                  id: 0,
                  image: Images.explore,
                  name: LanguageProvider.translate('home', 'explore'),
                );
                return Padding(
                  padding: EdgeInsets.zero,
                  child: CategoryHomeContainerWidget(
                    isSvg: true,
                    fontWeight: FontWeight.bold,
                    textColor: AppColor.primaryColor,
                    category: exploreCategory,
                    showText: showExplore,
                  ),
                );
              }

              final category = showExplore
                  ? categories[index - 1]
                  : categories[index];

              return Padding(
                padding: EdgeInsets.zero,
                child: CategoryHomeContainerWidget(
                  category: category,
                  showText: showExplore,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
