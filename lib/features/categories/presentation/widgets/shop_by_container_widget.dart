import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShopByContainerWidget extends StatelessWidget {
  const ShopByContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 7.w,
          height: 6.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.primaryColor, width: 0.6),
          ),
        ),
        SizedBox(width: 2.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageProvider.translate('categories', 'shop_by'),
              style: TextStyleClass.normalStyle(
                color: AppColor.tertiaryColor,
              ).copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              'APPLE STORE',
              style: TextStyleClass.normalStyle(
                color: Colors.black,
              ).copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ],
        ),
        const Spacer(),
        Text(
          LanguageProvider.translate('home', 'see_all'),
          style: TextStyleClass.normalStyle().copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xffAEB1C1),
          ),
        ),
      ],
    );
  }
}
