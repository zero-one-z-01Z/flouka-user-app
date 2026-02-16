// ignore_for_file: unused_import

import 'package:flouka/features/categories/presentation/widgets/new_categories_home_section.dart';
import 'package:flouka/features/categories/presentation/widgets/popular_categories_Section.dart';
import 'package:flouka/features/home/presentation/widgets/far_away_container_widget.dart';
import 'package:flouka/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:flouka/features/home/presentation/widgets/recommended_section.dart';
import 'package:flouka/features/filters/presentation/widgets/filter_list_widget.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_home_section.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/banners/presentation/widgets/carousel_slider_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../offers_section/presentation/widgets/offer_section_list_widget.dart';
import '../../../stories/presentation/widgets/stories_list_widget.dart';

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
            const StoriesListWidget(),
            const CarouselSliderWidget(),
            const NewCategoriesHomeSection(),
            const PopularCategoriesSection(),
            const FilterListWidget(),
            const OfferSectionListWidget(),
            const StoresHomeSection(),
            // const RecommendedSection(),
            // const BrandStoreContainerWidget(),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
