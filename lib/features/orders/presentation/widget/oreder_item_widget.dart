import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/order_entity.dart';
import '../provider/order_details_provider.dart';

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
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: orderEntity.getFirtstProduct().productEntity!.image ?? "",
              fit: BoxFit.fill,
              width: 25.w,
              errorWidget: (context, url, error) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderEntity.getFirtstProduct().productEntity!.description ??
                          "",
                      style: TextStyleClass.normalStyle(),
                    ),
                    Text(
                      getDiffTime(orderEntity.createdAt!),
                      style: TextStyleClass.normalStyle(),
                    ),
                  ],
                ),
              ),
            ),
            if (orderEntity.status == OrderStatus.pending)
              Column(
                spacing: 8,
                children: [
                  const Icon(Icons.pending, color: Colors.blue),
                  Text(
                    LanguageProvider.translate("global", "in_progress"),
                    style: TextStyleClass.normalStyle().copyWith(color: Colors.blue),
                  ),
                ],
              ),
            if (orderEntity.status == OrderStatus.accepted)
              Column(
                spacing: 8,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  Text(
                    LanguageProvider.translate("global", "order_accepted"),
                    style: TextStyleClass.normalStyle().copyWith(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            if (orderEntity.status == OrderStatus.delivery)
              Column(
                spacing: 8,
                children: [
                  const Icon(Icons.local_shipping, color: Colors.black),
                  Text(
                    LanguageProvider.translate("global", "order_delivered"),
                    style: TextStyleClass.normalStyle().copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
