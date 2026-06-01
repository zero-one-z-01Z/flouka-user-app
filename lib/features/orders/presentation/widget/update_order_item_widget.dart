import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/order_entity.dart';

class UpdateOrderItemWidget extends StatelessWidget {
  const UpdateOrderItemWidget({super.key, required this.orderItem});
  final OrderItemEntity orderItem;
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
                    imageUrl: "${orderItem.product?.image}",
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      spacing: 1.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${orderItem.product?.title}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyleClass.normalStyle().copyWith(
                            color: const Color(0xff333542),
                          ),
                        ),
                        // if (!isOutOfStock)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // PriceWidget(price: orderItem.product?.price ?? 0),
                            if (orderItem.status != OrderItemStatus.outOfStock)
                              ButtonWidget(
                                width: 27.w,
                                color: const Color(0xff00920A),
                                textStyle: TextStyleClass.normalStyle().copyWith(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                                height: 3.5.h,
                                onTap: () {},
                                text: LanguageProvider.translate(
                                  "global",
                                  "available",
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (orderItem.status == OrderItemStatus.outOfStock)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageProvider.translate("global", "this_item_unavailable"),
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
                      text: LanguageProvider.translate("global", "out_of_stock"),
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
