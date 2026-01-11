import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../core/widgets/price_widget.dart';

class UpdateOrderItemWidget extends StatelessWidget {
  const UpdateOrderItemWidget({super.key, required this.isOutOfStock});
  final bool isOutOfStock;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.h,
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: 20.w,
                    imageUrl: "https://placehold.co/600x400",
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      spacing: 1.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "new product",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyleClass.normalStyle().copyWith(
                            color: const Color(0xff333542),
                          ),
                        ),
                        // if (!isOutOfStock)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PriceWidget(price: 999),
                            if (!isOutOfStock)
                              ButtonWidget(
                                width: 27.w,
                                color: const Color(0xff00920A),
                                textStyle: TextStyleClass.normalStyle().copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                                height: 3.5.h,
                                onTap: () {},
                                text: "Available",
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (isOutOfStock)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageProvider.translate(
                        "global",
                        "This item is currently unavailable",
                      ),
                      style: TextStyleClass.normalStyle().copyWith(
                        fontSize: 15.sp,
                        color: const Color(0xffFF0000),
                      ),
                    ),
                    ButtonWidget(
                      width: 27.w,
                      color: const Color(0xff950526),
                      textStyle: TextStyleClass.normalStyle().copyWith(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                      height: 3.5.h,
                      onTap: () {},
                      text: "Out of stock",
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
