import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flouka/features/categories/domain/entity/subcategory_entity.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/view/categories_view_all_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubcategoryTile extends StatelessWidget {
  const SubcategoryTile({super.key, this.subcategory, this.isAll = false});

  final SubcategoryEntity? subcategory;
  final bool isAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF0F1F5),
      ),
      child: Row(
        children: [
          if (!isAll && subcategory != null) ...[
            SizedBox(width: 1.w),
            CachedNetworkImage(
              imageUrl: subcategory!.image,
              width: 12.w,
              height: 5.h,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(width: 2.w),
            Text(
              subcategory!.title,
              style: TextStyleClass.normalStyle(
                color: Colors.black,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ] else ...[
            SizedBox(width: 1.w),
            Container(
              width: 12.w,
              height: 5.h,
              color: const Color(0xffDCDCDC),
              child: Icon(Icons.menu, size: 8.w),
            ),
            SizedBox(width: 2.w),
            InkWell(
              onTap: () {
                final subcategoryProvider = context.read<SubcategoryProvider>();
                final categoryProvider = context.read<CategoryProvider>();

                CategoryEntity category;
                if (subcategoryProvider.categoryId != null) {
                  final idx = categoryProvider.categories.indexWhere(
                    (c) => c.id == subcategoryProvider.categoryId,
                  );
                  if (idx != -1) {
                    category = categoryProvider.categories[idx];
                  } else {
                    category = categoryProvider.categories.first;
                  }
                } else {
                  category = categoryProvider.categories.first;
                }

                navP(CategoriesViewAllPage(category: category));
              },
              child: Text(
                'View all',
                style: TextStyleClass.normalStyle(
                  color: Colors.black,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
