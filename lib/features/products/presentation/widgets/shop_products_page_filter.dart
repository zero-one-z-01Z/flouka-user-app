import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/categories/presentation/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ShopProductsPageFilter extends StatelessWidget {
  const ShopProductsPageFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.5.h,
      child: Consumer<FilterProvider>(
        builder: (context, provider, _) {
          final selected = provider.selectedFilter;

          // Brand chips data (e.g. HP, Lenovo, Apple, ...)
          final brandFilters = <String>[
            'HP',
            'Lenovo',
            'Apple',
            'Dell',
            'Asus',
          ];

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // First two: special filters (Brand and Price)
          // Then dynamic brand filters
          final totalCount = 2 + brandFilters.length;

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: totalCount,
            separatorBuilder: (_, __) => SizedBox(width: 2.w),
            itemBuilder: (context, index) {
              // 0: Brand chip with left icon
              if (index == 0) {
                const filterLabel = 'Brand';
                final isSelected = selected == filterLabel;

                return GestureDetector(
                  onTap: () => provider.selectFilter(filterLabel),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? AppColor.primaryColor
                            : const Color(0xffEAEAEA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SvgWidget(svg: Images.brand),
                        SizedBox(width: 1.w),
                        Text(
                          filterLabel,
                          style: TextStyleClass.normalStyle().copyWith(
                            fontSize: 15.sp,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? AppColor.primaryColor
                                : Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18.sp,
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              }

              // 1: Price chip with dropdown icon on the right
              if (index == 1) {
                const filterLabel = 'Price';
                final isSelected = selected == filterLabel;

                return GestureDetector(
                  onTap: () => provider.selectFilter(filterLabel),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? AppColor.primaryColor
                            : const Color(0xffEAEAEA),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgWidget(
                          svg: Images.price,
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.black,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          filterLabel,
                          style: TextStyleClass.normalStyle().copyWith(
                            fontSize: 15.sp,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? AppColor.primaryColor
                                : Colors.black,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18.sp,
                          color: isSelected
                              ? AppColor.primaryColor
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Remaining: brand filters from local brandFilters list
              final brandIndex = index - 2;
              final filter = brandFilters[brandIndex];
              final isSelected = filter == selected;

              return GestureDetector(
                onTap: () => provider.selectFilter(filter),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? AppColor.primaryColor
                          : const Color(0xffEAEAEA),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    filter,
                    style: TextStyleClass.normalStyle().copyWith(
                      fontSize: 15.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected ? AppColor.primaryColor : Colors.black,
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
