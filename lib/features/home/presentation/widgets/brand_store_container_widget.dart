import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/widgets/hot_deals_home_section.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrandStoreContainerWidget extends StatelessWidget {
  const BrandStoreContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 0.2.h,
      ).copyWith(left: 2.5.w, top: 1.h, bottom: 1.h),
      color: const Color(0xff2E2E2E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 14, child: Image.asset(Images.preson)),
                        SizedBox(width: 1.w),
                        Text(
                          'BrandStore',
                          style: TextStyleClass.normalStyle().copyWith(
                            color: AppColor.primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      LanguageProvider.translate('global', 'say_hello'),
                      style: TextStyleClass.normalStyle().copyWith(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ButtonWidget(
                  onTap: () {},
                  text: 'shop_there',
                  color: AppColor.primaryColor,
                  borderRadius: 12,
                  width: 25.w,
                  height: 2.5.h,
                  textStyle: TextStyleClass.smallStyle().copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const HotDealsHomeSection(showTitle: false),
        ],
      ),
    );
  }
}
