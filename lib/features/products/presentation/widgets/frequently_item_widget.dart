
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';

class FrequentlyItemWidget extends StatelessWidget {
  const FrequentlyItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: const Color(0xffefefef),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                width: 20.w,
                height: 10.h,
                fit: BoxFit.cover,
                imageUrl: "https://placehold.co/600x400/000000/FFFFFF/png",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(height: 1.h),
              const PriceWidget(price: 200),
              SizedBox(height: 1.h),
              SizedBox(
                width: 20.w,
                child: Text(
                  textAlign: TextAlign.center,
                  "AIRPODS APPLE PRO V2",
                  style: TextStyleClass.smallStyle(
                    color: Colors.grey,
                  ).copyWith(fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 4.w,
          height: 4.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColor.primaryColor,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 15),
        ),
      ],
    );
  }
}
