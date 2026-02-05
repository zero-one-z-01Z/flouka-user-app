import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/banners/presentation/widgets/carousel_slider_widget.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/categories/presentation/widgets/categories_home_explore.dart';
import 'package:flouka/features/categories/presentation/widgets/categories_view_all_filter_widget.dart';
import 'package:flouka/core/widgets/searchbar_container.dart';
import 'package:flouka/features/categories/presentation/widgets/shop_by_container_widget.dart';
import 'package:flouka/features/products/presentation/widgets/shop_products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoriesViewAllPage extends StatelessWidget {
  const CategoriesViewAllPage({super.key, this.category});

  final CategoryEntity? category;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    child: SearchbarContainer(
                      suffixIcon: SvgWidget(
                        svg: AppImages.aiSearch,
                        width: 1.w,
                        height: 1.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    width: 12.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xff221F1F).withOpacity(0.2),
                      ),
                    ),
                    child: Center(
                      child: SvgWidget(
                        svg: AppImages.navbarCart,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              const CategoriesViewAllFilterWidget(),
              const CarouselSliderWidget(),
              const CategoriesHomeExplore(showExplore: false),
              const ShopByContainerWidget(),
              const ShopProductsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
