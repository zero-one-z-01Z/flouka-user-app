
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SkipWithLogoWidget extends StatelessWidget {
  const SkipWithLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10.w),
          Image.asset(Images.logo),
          Text(
            LanguageProvider.translate("on_boarding", "Skip"),
            style: TextStyleClass.normalStyle(),
          ),
        ],
      ),
    );
  }
}
