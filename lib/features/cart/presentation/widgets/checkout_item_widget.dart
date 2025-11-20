import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/cart_entity.dart';
import 'checkout_count_widget.dart';

class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h, bottom: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 3.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CheckoutCountWidget(),
              Icon(Icons.arrow_forward_ios, size: 15.sp),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffeffbff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  width: 20.w,
                  imageUrl:
                      cartEntity.product?.image ?? "https://placehold.co/600x400",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    spacing: 1.h,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        cartEntity.product?.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyleClass.normalStyle().copyWith(
                          color: const Color(0xff333542),
                        ),
                      ),
                      Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PriceWidget(
                            price: convertDataToNum(cartEntity.subTotal) ?? 999,
                          ),
                          const Spacer(),
                          const CustomStarRatingWidget(),
                          Text(
                            "153,254",
                            style: TextStyleClass.smallStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
