
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/config/app_color.dart';
import '../../domain/entity/product_entity.dart';
import '../providers/products_details_provider.dart';

class CustomProductDetailsDotsIndicators extends StatelessWidget {
  const CustomProductDetailsDotsIndicators({super.key, required this.imagesList});
  final List<ProductImage> imagesList;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return SmoothPageIndicator(
      controller: productDetailsProvider.pageController,
      count: imagesList.length,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
        spacing: 8.0,
        radius: 60,
        dotWidth: 10,
        dotHeight: 10.0,
        dotColor: Colors.grey.shade300,
        activeDotColor: AppColor.primaryColor,
      ),
    );
  }
}
