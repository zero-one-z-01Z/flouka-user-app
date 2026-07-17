import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import 'package:flouka/features/orders/presentation/widget/new_widgets/order_store_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_color.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../language/presentation/provider/language_provider.dart';
import '../../provider/get_edit_order_provider.dart';
import '../item_out_of_stock_widget.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 2.w, color: order.status.color),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ID Widget
                      IdWidget(order: order,),
                      if(order.isAnyUnavailable())...[
                        SizedBox(height: 2.h),
                        ItemOutOfStockWidget(id: order.id!,),
                        SizedBox(height: 2.h),
                      ],
                      // store
                      ...List.generate(order.vendorOrders?.length??0, (v){
                        VendorOrderEntity vendor = order.vendorOrders![v];
                        return OrderStoreWidget(vendor: vendor,order: order);
                      }),
                      if(order.isAnyUnavailable() || order.status ==OrderStatus.paid)...[
                        SizedBox(height: 2.h),
                        ButtonWidget(
                          color: const Color(0xff950526),
                          onTap: () {
                            Provider.of<GetEditOrderProvider>(context,listen: false).cancelOrder(id: order.id!,isFromOrderDetails: true);
                          },
                          text: LanguageProvider.translate("orders", "cancel_entire_order"),
                          textStyle: TextStyleClass.normalStyle().copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 2.h),
                      ],

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class IdWidget extends StatelessWidget {
  const IdWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'ID: #${order.id}',
          style: TextStyleClass.semiHeadStyle().copyWith(
            color: Colors.black.withValues(alpha: 0.5),
          ),
          textAlign: TextAlign.start,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.6.h),
          decoration: BoxDecoration(
            color: order.status.color.withAlpha(50),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: order.status.color,),
          ),
          child: Text(
            LanguageProvider.translate('orders', order.status.text),
            style: TextStyleClass.normalStyle().copyWith(
              color: order.status.color,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
