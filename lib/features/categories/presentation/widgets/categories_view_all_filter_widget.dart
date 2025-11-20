import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/categories/presentation/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoriesViewAllFilterWidget extends StatelessWidget {
  const CategoriesViewAllFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.5.h,
      child: Consumer<FilterProvider>(
        builder: (context, provider, _) {
          final filters = provider.filters;
          final selected = provider.selectedFilter;

          if (filters.isEmpty && provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (_, __) => SizedBox(width: 2.w),
            itemBuilder: (context, index) {
              final filter = filters[index];
              final isSelected = filter == selected;

              return GestureDetector(
                onTap: () => provider.selectFilter(filter),
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
                    filter,
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
          );
        },
      ),
    );
  }
}
