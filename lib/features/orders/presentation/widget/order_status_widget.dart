import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../language/presentation/provider/language_provider.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../domain/entity/order_entity.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key, required this.orderStatus});
  final OrderStatus orderStatus;

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
          CircleAvatar(
            radius: 7.w,
            backgroundColor: const Color(0xff077933),
            child: SvgWidget(
              svg: AppImages.settingsOrders,
              color: Colors.white,
              width: 4.5.w,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageProvider.translate("orders", orderStatus.text),
                style: TextStyleClass.normalStyle().copyWith(
                  color: const Color(0xff077933),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                LanguageProvider.translate("orders", "date_oct_14"),
                style: TextStyleClass.smallStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
