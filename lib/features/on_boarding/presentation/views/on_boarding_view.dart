import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/on_boarding_provider.dart';
import '../widgets/custom_dots_indicator.dart';
import '../widgets/on_boarding_item_widget.dart';
import '../widgets/skip_with_logo_widget.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return Scaffold(
      // this stack is for logo and skip in the top of the screen
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: onBoardingProvider.pageController,
                  itemCount: onBoardingProvider.onBoardingList.length,
                  itemBuilder: (context, index) {
                    return OnBoardingItemWidget(
                      onBoardingEntity: onBoardingProvider.onBoardingList[index],
                      isBackGroundImageLeft: index == 1,
                    );
                  },
                ),
              ),
              const CustomDotsIndicators(),
              SizedBox(height: 5.h),
              ButtonWidget(
                onTap: onBoardingProvider.onNextButtonPressed,
                text: "next",
              ),
              SizedBox(height: 5.h),
            ],
          ),
          Positioned(top: 8.h, left: 0, right: 0, child: const SkipWithLogoWidget()),
        ],
      ),
    );
  }
}
