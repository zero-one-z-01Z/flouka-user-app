import 'package:flouka/features/on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/config/app_color.dart';

class CustomDotsIndicators extends StatelessWidget {
  const CustomDotsIndicators({super.key});
  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return SmoothPageIndicator(
      controller: onBoardingProvider.pageController,
      count: onBoardingProvider.onBoardingList.length,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
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
