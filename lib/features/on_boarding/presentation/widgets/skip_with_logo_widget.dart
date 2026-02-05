import 'package:flouka/features/on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SkipWithLogoWidget extends StatelessWidget {
  const SkipWithLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingProvider onBoardingProvider = Provider.of(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10.w),
          Transform.scale(scale: 1.1, child: Image.asset(AppImages.logo)),
          InkWell(
            onTap: () {
              onBoardingProvider.skipButtonPressed();
            },
            child: Padding(
              padding: EdgeInsets.only(top: .6.h),
              child: Text(
                LanguageProvider.translate("on_boarding", "Skip"),
                style: TextStyleClass.normalStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
