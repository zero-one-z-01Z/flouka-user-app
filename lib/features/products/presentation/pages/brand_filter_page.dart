import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/providers/brand_provider.dart';

import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/button_widget.dart';

class BrandFilterPage extends StatelessWidget {
  const BrandFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: Text(
          LanguageProvider.translate('filter', 'brand_filter'),
          style: TextStyleClass.normalStyle().copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<BrandProvider>(
        builder: (context, provider, _) {
          final grouped = provider.groupedBrands;
          final letters = grouped.keys.toList();

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                SizedBox(height: 2.h),
                // Search bar (same style as categories searchbar)
                Container(
                  width: double.infinity,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xff221F1F).withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      children: [
                        const SvgWidget(
                          svg: Images.search,
                          color: Color(0xff7A7979),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          LanguageProvider.translate('filter', 'search'),
                          style: TextStyleClass.normalStyle(
                            color: const Color(0xff7A7979),
                          ).copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                // Brands list
                Expanded(
                  child: ListView.builder(
                    itemCount: letters.length,
                    itemBuilder: (context, index) {
                      final letter = letters[index];
                      final brands = grouped[letter] ?? [];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Letter header
                          Container(
                            width: double.infinity,
                            color: const Color(0xffF5F5F5),
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.h,
                            ),
                            child: Text(
                              letter,
                              style: TextStyleClass.normalStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Brands under this letter
                          ...brands.map((brand) {
                            final isSelected = provider.isSelected(brand);
                            return ListTile(
                              onTap: () => provider.toggleBrand(brand),
                              title: Text(
                                brand,
                                style: TextStyleClass.normalStyle().copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColor.primaryColor
                                        : const Color(0xffC4C4C4),
                                  ),
                                  color: isSelected
                                      ? AppColor.primaryColor
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            );
                          }),
                        ],
                      );
                    },
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
        child: ButtonWidget(
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
      ),
    );
  }
}
