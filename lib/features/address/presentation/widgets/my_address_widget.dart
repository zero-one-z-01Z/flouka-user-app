import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';

class MyAddressWidget extends StatelessWidget {
  const MyAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 1.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageProvider.translate("global", "address"),
            style: TextStyleClass.normalStyle().copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: const Color(0xffeffbff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              spacing: 3.w,
              children: [
                const SvgWidget(svg: AppImages.locationFilled),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanguageProvider.translate("global", "Deliver To"),
                        style: TextStyleClass.smallStyle(
                          color: const Color(0xff535353),
                        ).copyWith(fontSize: 13.sp),
                      ),
                      Text(
                        "26 amna hafiz /street 23/door 24 alexandria sidegaber el mosher tantaimow",
                        style: TextStyleClass.smallStyle().copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
