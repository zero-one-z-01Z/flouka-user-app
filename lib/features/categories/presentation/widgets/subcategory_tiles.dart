import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../products/presentation/providers/categories_product_search_provider.dart';

class SubcategoryTile extends StatelessWidget {
  const SubcategoryTile({super.key, this.subcategory, this.isAll = false});

  final CategoryEntity? subcategory;
  final bool isAll;

  @override
  Widget build(BuildContext context) {
    CategoriesProductSearchProvider provider = Provider.of(context, listen: false);
    SubcategoryProvider categoryProvider = Provider.of(context, listen: false);

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
            InkWell(
              onTap: () {
                provider.goToCategoriesPage(category:subcategory!,isSubCategory: true);
              },
              child: Row(
                children: [
                  SizedBox(width: 1.w),
                  CachedNetworkImage(
                    imageUrl: subcategory!.image,
                    width: 12.w,
                    height: 5.h,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    subcategory!.name,
                    style: TextStyleClass.normalStyle(
                      color: Colors.black,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ] else ...[
            InkWell(
              onTap: () {
                if(categoryProvider.selectedCategory !=null){
                  provider.goToCategoriesPage(category:categoryProvider.selectedCategory!);
                }
              },
              child: Row(
                children: [
                  SizedBox(width: 1.w),
                  Container(
                    width: 12.w,
                    height: 5.h,
                    color: const Color(0xffDCDCDC),
                    child: Icon(Icons.menu, size: 8.w),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'View all',
                    style: TextStyleClass.normalStyle(
                      color: Colors.black,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
