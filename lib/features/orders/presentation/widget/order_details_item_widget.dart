import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/reviews/presentation/providres/create_rate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/entity/order_entity.dart';

class OrderDetailsItemWidget extends StatelessWidget {
  const OrderDetailsItemWidget({super.key, required this.orderDetailsEntity});
  final OrderDetailsEntity orderDetailsEntity;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h, bottom: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageProvider.translate("global", "item_summary"),
                  style: TextStyleClass.normalStyle(),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),

          Wrap(
            spacing: 2.w,
            children: List.generate(
              orderDetailsEntity.vendorOrder?.items?.length ?? 0,
              (index) {
              OrderItemEntity orderItem = orderDetailsEntity.vendorOrder!.items![index];
                String? name = orderItem.variant !=null ? (orderItem.variant!.name) : (orderItem.product!.title);
                num? price = orderItem.variant !=null ? (orderItem.variant!.finalPrice) : (orderItem.product!.finalPrice);

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          width: 20.w,
                          imageUrl:
                              orderDetailsEntity.vendorOrder?.items?[index].product?.image ??
                              "https://placehold.co/600x400",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyleClass.normalStyle().copyWith(
                                color: const Color(0xff333542),
                              ),
                            ),
                            Text(
                              LanguageProvider.translate("orders", orderDetailsEntity.vendorOrder?.items?[index].status?.text ?? ""),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyleClass.smallStyle().copyWith(
                                color: orderDetailsEntity.vendorOrder?.items?[index].status?.color ?? Colors.black,
                              ),
                            ),
                            Text("${price}\$",style: TextStyleClass.smallStyle(),)
                          ],
                        )),
                        SizedBox(width: 2.w),
                        if(orderItem.canReviewProduct??false)
                          Expanded(
                            child: ButtonWidget(
                              borderRadius: 10,
                              color: const Color(0xffdff7ff),
                              onTap: () {
                                CreateRateProvider createRateProvider = Provider.of(context, listen: false);
                                createRateProvider.gotoReviewPage(itemId: orderItem.productId!, orderId: orderDetailsEntity.id!, product: true);
                              },
                              text:"rate",
                              textStyle: TextStyleClass.smallStyle(),
                              height: 4.h,
                            ),
                          ),
                      ],
                    ),

                    if (index < ((orderDetailsEntity.vendorOrder?.items?.length ?? 0) - 1))
                      Container(
                        color: Colors.grey.shade200,
                        width: 100.w,
                        height: 0.2.h,
                        margin: EdgeInsets.symmetric(vertical: 2.h),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
