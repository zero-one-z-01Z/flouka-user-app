import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/svg_widget.dart';
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
        return Column(spacing: 1.h,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics:const AlwaysScrollableScrollPhysics(),
                child: Row(spacing: 2.w,
                  children: List.generate(filters.length, (index) {
                    final filter = filters[index];
                    final isSelected = filter == selected;

                    return GestureDetector(
                      onTap: () => categoriesProvider.selectCategory(filter),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelected ? AppColor.primaryColor : Colors.transparent),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            if(filter.icon != null)
                            SvgWidget(
                              svg: filter.icon!,
                              width: 5.w,
                              height: 5.h,
                            ),
                            if(filter.image != null && filter.icon==null)
                              Container(
                                width: 5.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(filter.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                              filter.name,
                              style: TextStyleClass.normalStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected ?AppColor.primaryColor  :Colors.black ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
            ),
            if(categoriesProvider.category != null && categoriesProvider.category!.children!.isNotEmpty)
              Container(
              padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics:const AlwaysScrollableScrollPhysics(),
                child: Row(spacing: 2.w,
                  children: List.generate(categoriesProvider.category!.children!.length, (index) {
                    final filter = categoriesProvider.category!.children![index];
                    final isSelected = filter == categoriesProvider.subcategory;

                    return GestureDetector(
                      onTap: () => categoriesProvider.selectSubCategory(filter),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelected ? AppColor.primaryColor : Colors.transparent),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            if(filter.icon != null)
                              SvgWidget(
                                svg: filter.icon!,
                                width: 5.w,
                                height: 5.h,
                              ),
                            if(filter.image != null && filter.icon==null)
                              Container(
                                width: 5.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(filter.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            Text(
                              filter.name,
                              style: TextStyleClass.normalStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected ?AppColor.primaryColor  :Colors.black ,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

//            SizedBox(
//               height: 3.5.h,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categoriesProvider.category!.children!.length,
//                 separatorBuilder: (_, __) => SizedBox(width: 2.w),
//                 itemBuilder: (context, index) {
//                   final filter = categoriesProvider.category!.children![index];
//                   final isSelected = filter == categoriesProvider.subcategory;
//
//                   return GestureDetector(
//                     onTap: () => categoriesProvider.selectSubCategory(filter),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? AppColor.primaryColor
//                             : const Color(0xffEAEAEA),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         filter.name,
//                         style: TextStyleClass.normalStyle().copyWith(
//                           fontSize: 15.sp,
//                           fontWeight: isSelected
//                               ? FontWeight.w600
//                               : FontWeight.w400,
//                           color: isSelected ? Colors.white : Colors.black,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),