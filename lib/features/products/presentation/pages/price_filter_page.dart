import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widgets/custom_range_slider.dart';

class PriceFilterPage extends StatelessWidget {
  const PriceFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Filter'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                SvgWidget(svg: Images.price, color: AppColor.primaryColor),
                SizedBox(width: 1.w),
                Text(
                  LanguageProvider.translate("filter", "price"),
                  style: TextStyleClass.normalStyle().copyWith(
                    fontSize: 16.sp,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            const CustomRangeSlider(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 4.w,
        ).copyWith(bottom: 5.h),
        child: ButtonWidget(
          onTap: () {
            // navP(const PriceFilterPage());
          },
          text: 'apply',
          width: 54.w,
          height: 5.h,
          borderRadius: 10,
          textStyle: TextStyleClass.normalStyle().copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
