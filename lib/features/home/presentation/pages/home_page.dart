// ignore_for_file: unused_import

import 'package:flouka/features/categories/presentation/widgets/new_categories_home_section.dart';
import 'package:flouka/features/categories/presentation/widgets/popular_categories_Section.dart';
import 'package:flouka/features/home/presentation/widgets/far_away_container_widget.dart';
import 'package:flouka/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:flouka/features/home/presentation/widgets/recommended_section.dart';
import 'package:flouka/features/filters/presentation/widgets/filter_list_widget.dart';
import 'package:flouka/features/products/presentation/widgets/filtered_products_home_section.dart';
import 'package:flouka/features/stores/presentation/widgets/stores_home_section.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/banners/presentation/widgets/carousel_slider_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../offers_section/presentation/providers/offer_section_provider.dart';
import '../../../offers_section/presentation/widgets/offer_section_list_widget.dart';
import '../../../stories/presentation/widgets/stories_list_widget.dart';
import '../widgets/list_text_widget.dart';
import '../widgets/product_home_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final offerSectionProvider = Provider.of<OfferSectionProvider>(context);
    return Container(width: 100.w,height: 100.h,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              left: 0,right: 0,
              child: SvgWidget(svg: AppImages.topSectionSvg,width: 100.w,height: 45.h,fit: BoxFit.fill,),
            ),

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HomeAppbarWidget(),
                  if(authProvider.isAwayFromHome())
                  const FarAwayContainerWidget(),
                  const StoriesListWidget(),
                  const FilterListWidget(),
                  const FilteredProductsHomeSection(),
                  const CarouselSliderWidget(),
                  // const NewCategoriesHomeSection(),
                  const PopularCategoriesSection(),
                  const ListTextWidget(),
                  const OfferSectionListWidget(),
                  if(offerSectionProvider.data ==null || offerSectionProvider.data!=null &&offerSectionProvider.data!.isEmpty)
                    ...[
                      const ProductHomeCardWidget(),
                      const StoresHomeSection(),
                      // const RecommendedSection(),
                    ],
                  // const BrandStoreContainerWidget(),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
