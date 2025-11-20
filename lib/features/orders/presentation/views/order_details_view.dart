// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:raval/core/constants/app_lottie.dart';
// import 'package:raval/core/widgets/button_widget.dart';
// import 'package:raval/features/orders/presentation/provider/order_details_provider.dart';
// import 'package:raval/features/orders/presentation/provider/order_provider.dart';
// import 'package:raval/features/orders/presentation/widget/order_status_widget.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../core/config/app_styles.dart';
// import '../../../../core/widgets/loading_animation_widget.dart';
// import '../../../address/presentation/widgets/delivery_address_widget.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../../domain/entity/order_entity.dart';
// import '../widget/order_details_item_widget.dart';
// import '../widget/order_info_widget.dart';
// import '../widget/order_price_item_widget.dart';

// class OrderDetailsView extends StatelessWidget {
//   const OrderDetailsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final OrderDetailsProvider orderDetailsProvider =
//         Provider.of<OrderDetailsProvider>(context);
//     final OrderProvider orderProvider = Provider.of<OrderProvider>(context);
//     return Scaffold(
//       backgroundColor: const Color(0xfff7f5f5),
//       appBar: AppBar(
//         title: Text(
//           LanguageProvider.translate("global", "order_details"),
//           style: AppStyles.style18Normal.copyWith(fontWeight: FontWeight.w500),
//         ),
//         // leading: IconButton(
//         //   onPressed: () => Navigator.pop(context),
//         //   icon: const Icon(Icons.arrow_back_ios_new),
//         // ),
//       ),
//       body: Builder(
//         builder: (context) {
//           if (orderDetailsProvider.data == null) {
//             return const Center(
//               child: LoadingAnimationWidget(
//                 gif: AppLottie.loading,

//               ),
//             );
//           }

//           return SizedBox(
//             height: 100.h,
//             width: 100.w,
//             child: SingleChildScrollView(
//               physics: const AlwaysScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   OrderInfoItemWidget(
//                     title: LanguageProvider.translate("global", "order_id"),
//                     info: orderDetailsProvider.data?.id.toString() ?? "",
//                   ),
//                   OrderPriceExpansionTileWidget(
//                     title: LanguageProvider.translate("global", "total_prices"),
//                     info: "${orderDetailsProvider.data?.total} ${LanguageProvider.translate("global", "dinar")}",
//                   ),
//                   SizedBox(height: 1.3.h),
//                   Text(
//                     LanguageProvider.translate("global", "shipment_address"),
//                     style: AppStyles.style16Normal.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 1.3.h),
//                   const DeliveryAddressWidget(withoutArrow: true),
//                   SizedBox(height: 1.3.h),
//                   const OrderStatusWidget(),
//                   SizedBox(height: 1.3.h),

//                   if (orderDetailsProvider.data?.status == OrderStatus.pending)
//                     ButtonWidget(
//                       color: Colors.redAccent,
//                       onTap: () {
//                         orderProvider.showCancelOrderDialog(
//                           orderDetailsProvider,
//                           orderDetailsProvider.data!.id!,
//                         );
//                       },
//                       text: "cancel_order",
//                     ),
//                   Text(
//                     "${LanguageProvider.translate("global", "the_order")} "
//                     " 1 "
//                     "${LanguageProvider.translate("global", "from")}"
//                     " ${orderDetailsProvider.data!.orderDetails.length} ",
//                     style: AppStyles.style16Normal.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   OrderDetailsItemWidget(
//                     orderDetailsEntity:
//                         orderDetailsProvider.data!.orderDetails.first,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
