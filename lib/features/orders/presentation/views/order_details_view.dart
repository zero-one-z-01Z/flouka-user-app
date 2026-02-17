import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/features/orders/presentation/widget/share_your_experience_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../cart/presentation/widgets/price_details_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/order_entity.dart';
import '../provider/order_details_provider.dart';
import '../provider/order_provider.dart';
import '../widget/custom_order_payment_way_widget.dart';
import '../widget/order_info_widget.dart';
import '../widget/order_status_widget.dart';
// import '../widget/order_price_item_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderDetailsProvider orderDetailsProvider =
        Provider.of<OrderDetailsProvider>(context);
    final OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f5),
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate("global", "Tracking Details"),
          style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (orderDetailsProvider.data == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          return SizedBox(
            height: 100.h,
            width: 100.w,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  OrderInfoItemWidget(
                    title: LanguageProvider.translate("global", "Order ID"),
                    info: orderDetailsProvider.data?.id.toString() ?? "",
                  ),
                  OrderStatusWidget(
                    orderStatus:
                        orderDetailsProvider.data?.status ?? OrderStatus.pending,
                  ),
                  SizedBox(height: 1.3.h),
                  // const DeliveryAddressWidget(),
                  SizedBox(height: 1.3.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: const ShareYourExperienceWidget(),
                  ),
                  SizedBox(height: 1.3.h),
                  // if (orderDetailsProvider.data?.status == OrderStatus.pending)
                  //   ButtonWidget(
                  //     color: Colors.redAccent,
                  //     onTap: () {
                  //       orderProvider.showCancelOrderDialog(
                  //         orderDetailsProvider,
                  //         orderDetailsProvider.data!.id!,
                  //       );
                  //     },
                  //     text: "cancel_order",
                  //   ),
                  // Text(
                  //   "${LanguageProvider.translate("global", "the_order")} "
                  //   " 1 "
                  //   "${LanguageProvider.translate("global", "from")}"
                  //   " ${orderDetailsProvider.data!.orderDetails.length} ",
                  //   style: TextStyleClass.normalStyle().copyWith(
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // OrderDetailsItemWidget(
                  //   orderDetailsEntity:
                  //       orderDetailsProvider.data!.orderDetails.first,
                  // ),
                  const CustomOrderPaymentWayWidget(),
                  SizedBox(height: 1.3.h),
                  const PriceDetailesList(isBold: true),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
