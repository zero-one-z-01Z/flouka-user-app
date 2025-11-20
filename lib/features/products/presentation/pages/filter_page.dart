import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/pages/brand_filter_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sizer/sizer.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = <String>[
      LanguageProvider.translate('filter', 'category'),
      LanguageProvider.translate('filter', 'brand'),
      LanguageProvider.translate('filter', 'price'),
      LanguageProvider.translate('filter', 'color'),
      LanguageProvider.translate('filter', 'screen_size'),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(LanguageProvider.translate('filters', 'filter')),
        leading: const BackButton(),
      ),
      body: ListView.separated(
        itemCount: labels.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Colors.black),
        itemBuilder: (context, index) {
          final text = labels[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Transform(
                  transform: Matrix4.rotationZ(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 4.w,
        ).copyWith(bottom: 5.h),
        child: Row(
          children: [
            ButtonWidget(
              onTap: () {},
              text: 'reset',
              width: 32.w,
              height: 5.h,
              color: Colors.transparent,
              borderRadius: 10,
              borderColor: AppColor.primaryColor,
              textStyle: TextStyleClass.normalStyle().copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4.w),
            ButtonWidget(
              onTap: () {
                navP(const BrandFilterPage());
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
          ],
        ),
      ),
    );
  }
}
