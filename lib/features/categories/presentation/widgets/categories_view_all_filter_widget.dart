import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../products/presentation/providers/categories_product_search_provider.dart';

class CategoriesViewAllFilterWidget extends StatelessWidget {
  const CategoriesViewAllFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesProductSearchProvider categoriesProvider = Provider.of(context, listen: false);

    return Consumer<CategoryProvider>(
      builder:(context, provider, child) {
        final filters = provider.categories;
        final selected = categoriesProvider.category;
        if (filters.isEmpty && provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(spacing: 1.h,
          children: [
            SizedBox(
              height: 3.5.h,
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (_, __) => SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = filter == selected;

                  return GestureDetector(
                    onTap: () => categoriesProvider.selectCategory(filter),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.primaryColor
                            : const Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filter.name,
                        style: TextStyleClass.normalStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if(categoriesProvider.category != null && categoriesProvider.category!.children!.isNotEmpty)
            SizedBox(
              height: 3.5.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesProvider.category!.children!.length,
                separatorBuilder: (_, __) => SizedBox(width: 2.w),
                itemBuilder: (context, index) {
                  final filter = categoriesProvider.category!.children![index];
                  final isSelected = filter == categoriesProvider.subcategory;

                  return GestureDetector(
                    onTap: () => categoriesProvider.selectSubCategory(filter),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.primaryColor
                            : const Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filter.name,
                        style: TextStyleClass.normalStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
