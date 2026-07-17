import 'package:flouka/features/orders/presentation/widget/new_widgets/order_vendor_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../language/presentation/provider/language_provider.dart';
import '../../../../reviews/presentation/providres/create_rate_provider.dart';
import '../../../domain/entity/order_entity.dart';
import '../../provider/order_details_provider.dart';

class OrderStoreWidget extends StatelessWidget {
  const OrderStoreWidget({super.key, required this.vendor, required this.order});
  final VendorOrderEntity vendor;
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    final OrderDetailsProvider orderDetailsProvider = Provider.of<OrderDetailsProvider>(context);
    final CreateRateProvider createRateProvider = Provider.of<CreateRateProvider>(context);
    return InkWell(
      onTap: (){
        orderDetailsProvider.goToPage({
          'order_id': order.id,
          'order_vendor_id': vendor.id,
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Container(height: 1, color: const Color(0xffEEEEEE),),
          SizedBox(height: 1.h),
          Row(
            children: [
              Text(LanguageProvider.translate('global', 'seller')+': ',style: TextStyleClass.normalStyle(),),
              Text(vendor.vendor?.name??"",style: TextStyleClass.normalStyle(),),
              Spacer(),
              if(vendor.canRateStore??false)ButtonWidget(onTap: (){
                createRateProvider.gotoReviewPage(itemId: vendor.store?.id??0, orderId: order.id!, product: false);
              }, text: 'rate_store',takeSmallestWidth: true,height: 3.h,
              textStyle: TextStyleClass.smallStyle(color: Colors.white),color: Colors.orangeAccent,),
            ],
          ),
          SizedBox(height: 1.h),
          // items
          OrderVendorItems(vendor: vendor, orderId: order.id!,),
          SizedBox(height: 1.h),
          Row(
            children: [
              Text("${vendor.items!.length} ${LanguageProvider.translate('global', 'products_count')}",
                style: TextStyleClass.normalStyle(),),
              SizedBox(width: 1.w,),
              CircleAvatar(radius: 1.w,backgroundColor: AppColor.primaryColor,),
              SizedBox(width: 2.w,),
              Text("${vendor.total} ${LanguageProvider.translate('global', 'currency')}",
                style: TextStyleClass.semiHeadStyle(
                  color: AppColor.primaryColor,
                ).copyWith(fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 1.h),
          ButtonWidget(onTap: (){
            orderDetailsProvider.goToPage({
              'order_id': order.id,
              'order_vendor_id': vendor.id,
            });
          }, text: 'show_details',
            color: Colors.white,
            borderColor: Colors.grey,textStyle: TextStyleClass.normalStyle(),height: 5.5.h,
            borderRadius: 12,),
        ],
      ),
    );
  }
}
