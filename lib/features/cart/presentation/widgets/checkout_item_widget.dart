import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../domain/entity/cart_entity.dart';

class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 20.w,
            imageUrl: cartEntity.product?.image ?? "",
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    cartEntity.product?.name ?? "",
                    style: TextStyleClass.normalStyle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
