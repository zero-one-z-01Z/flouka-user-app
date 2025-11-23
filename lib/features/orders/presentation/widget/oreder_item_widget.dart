import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/order_entity.dart';
import '../provider/order_details_provider.dart';
import 'share_your_experience_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    final OrderDetailsProvider orderDetailsProvider =
        Provider.of<OrderDetailsProvider>(context);
    return InkWell(
      onTap: () {
        orderDetailsProvider.goToPage({'order_id': orderEntity.id});
        log("order details");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 1.w,
              children: [
                Text(
                  LanguageProvider.translate("global", "Order ID"),
                  style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
                ),
                Text(
                  orderEntity.id.toString(),
                  style: TextStyleClass.normalStyle(
                    color: AppColor.primaryColor,
                  ).copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      orderEntity.orderDetails.first.productEntity?.image ?? " ",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderEntity.orderDetails.first.productEntity?.name ?? "ss ",
                        style: TextStyleClass.smallStyle(
                          color: const Color(0xff333542),
                        ),
                      ),
                      SizedBox(height: .5.h),
                      Text(
                        orderEntity.status?.name ?? "",
                        style: TextStyleClass.smallStyle(
                          color: Colors.green,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: .2.h),
                      Text(
                        "On Monday 13th ,12:45 PM",
                        style: TextStyleClass.smallStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            const ShareYourExperienceWidget(),
          ],
        ),
      ),
    );
  }
}
