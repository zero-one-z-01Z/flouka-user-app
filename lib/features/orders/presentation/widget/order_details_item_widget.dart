import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/order_details_entity.dart';

class OrderDetailsItemWidget extends StatelessWidget {
  const OrderDetailsItemWidget({super.key, required this.orderDetailsEntity});
  final OrderDetailsEntity orderDetailsEntity;
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
            imageUrl: orderDetailsEntity.productEntity!.image!,
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
                    orderDetailsEntity.productEntity!.name!,
                    style: TextStyleClass.normalStyle(),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      DottedBorder(
                        options: const RoundedRectDottedBorderOptions(
                          color: Colors.black,
                          strokeWidth: 1,
                          dashPattern: [4, 3],
                          radius: Radius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 2,
                          ),
                          child: Text(
                            orderDetailsEntity.size!,
                            style: TextStyleClass.normalStyle(),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 3.5.w,
                        backgroundColor: hexToColor(orderDetailsEntity.color!),
                      ),
                      const Spacer(),
                      PriceWidget(
                        price:
                            convertDataToNum(
                              orderDetailsEntity.productEntity!.price,
                            ) ??
                            5555,
                      ),
                    ],
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
