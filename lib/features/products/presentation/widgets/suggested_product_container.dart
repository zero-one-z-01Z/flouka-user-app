import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/widgets/price_widget.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_images.dart';

class SuggestedProductContainer extends StatelessWidget {
  const SuggestedProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: 'https://placehold.co/600x400/000000/FFFFFF/png',
                  height: 10.h,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bose Headphones', style: TextStyle(fontSize: 16.sp)),
                    Row(
                      children: [
                        PriceWidget(price: 100, fontSize: 16.sp),
                        SizedBox(width: 1.5.w),
                        Text(
                          "\$200",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 2.h,
                          width: 6.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAF8EC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '10% OFF',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
                      style: TextStyle(fontSize: 13.5.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        SvgWidget(
                          svg: AppImages.star,
                          color: Colors.amber,
                          width: 16.sp,
                        ),
                        SizedBox(width: 1.w),
                        Text('4.5', style: TextStyle(fontSize: 16.sp)),
                        SizedBox(width: 1.w),
                        const Spacer(),
                        Container(
                          height: 2.h,
                          width: 9.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffECF6FF),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              LanguageProvider.translate('global', 'staff_pick'),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff5FA1D5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 1.h,
          right: 3.w,
          child: Container(
            width: 7.w,
            height: 7.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(Icons.favorite_border, size: 4.w, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
