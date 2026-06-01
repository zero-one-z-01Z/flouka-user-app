import 'package:flouka/core/helper_function/convert.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../language/presentation/provider/language_provider.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/entity/order_entity.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key, required this.order});
  final OrderDetailsEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 4.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   radius: 7.w,
          //   backgroundColor: const Color(0xff077933),
          //   child: SvgWidget(
          //     svg: order.status!.image!,
          //     color: Colors.white,
          //     width: 4.5.w,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate("orders", order.status?.text??""),
                style: TextStyleClass.normalStyle().copyWith(
                  color: order.status?.color ?? Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(convertDateTimeToString(DateTime.parse(order.createdAt!)),
                style: TextStyleClass.smallStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
