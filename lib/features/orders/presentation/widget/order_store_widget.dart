import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/chat/presentation/provider/message_provider.dart';
import 'package:flouka/features/orders/domain/entity/order_details_entity.dart';
import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';

class OrderStoreWidget extends StatelessWidget {
  const OrderStoreWidget({super.key, required this.order});
  final OrderDetailsEntity order;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: AppColor.primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200),
                image: DecorationImage(
                  image: NetworkImage(order.vendorOrder!.vendor!.logo!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                order.vendorOrder!.vendor!.name!,
                style: TextStyleClass.normalStyle(),
              ),
            ),
            SizedBox(width: 2.w),
            if(!order.status!.isEnded)
            ButtonWidget(onTap: (){
              Provider.of<MessageProvider>(context, listen: false).goToMessagePage(
                orderId: order.id!,
                storeId: order.vendorOrder!.store!.id!,
              );
            }, text: "chat",width: 25.w,height: 4.h,borderRadius: 3,
              textStyle: TextStyleClass.normalStyle(color: Colors.white).copyWith(height: 1),),
          ],
        ),
      ),
    );
  }
}
