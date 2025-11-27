import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FarAwayContainerWidget extends StatelessWidget {
  const FarAwayContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 1.w,
            vertical: 0.2.h,
          ).copyWith(left: 9.w),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate('home', 'far_from_location'),
                style: TextStyleClass.normalStyle().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.5.sp,
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                LanguageProvider.translate('home', 'change'),
                style: TextStyleClass.normalStyle().copyWith(
                  color: AppColor.primaryColor,
                  fontSize: 14.5.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
