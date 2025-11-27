import 'package:flouka/features/categories/presentation/widgets/new_categories_home_section.dart';
import 'package:flouka/features/categories/presentation/widgets/popular_categories_Section.dart';
import 'package:flouka/features/home/presentation/widgets/far_away_container_widget.dart';
import 'package:flouka/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:flouka/features/products/presentation/widgets/filter_products.dart';
import 'package:flouka/features/products/presentation/widgets/filtered_products_home_section.dart';
import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_home_section.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/banners/presentation/widgets/carousel_slider_widget.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeAppbarWidget(),
            const FarAwayContainerWidget(),
            const CarouselSliderWidget(),
            const NewCategoriesHomeSection(),
            // const CategoriesHomeExplore(),
            const PopularCategoriesSection(),
            const FilterProductsWidget(),
            const FilteredProductsHomeSection(),
            const HotDealsHomeSection(),
            const StoresHomeSection(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
