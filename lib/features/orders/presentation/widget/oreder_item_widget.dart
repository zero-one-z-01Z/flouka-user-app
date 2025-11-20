// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:raval/core/helper_function/convert.dart';
// import 'package:raval/features/orders/domain/entity/order_entity.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../core/config/app_styles.dart';
// import '../../../../core/constants/assets.gen.dart';
// import '../../../language/presentation/provider/language_provider.dart';
// import '../provider/order_details_provider.dart';

// class OrderItemWidget extends StatelessWidget {
//   const OrderItemWidget({super.key, required this.orderEntity});
//   final OrderEntity orderEntity;
//   @override
//   Widget build(BuildContext context) {
//     final OrderDetailsProvider orderDetailsProvider =
//         Provider.of<OrderDetailsProvider>(context);
//     return InkWell(
//       onTap: () {
//         orderDetailsProvider.goToPage({'order_id': orderEntity.id});
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CachedNetworkImage(
//               imageUrl: orderEntity.getFirtstProduct().productEntity!.image ?? "",
//               fit: BoxFit.fill,
//               width: 25.w,
//               errorWidget: (context, url, error) {
//                 return Assets.images.home.cartImage.image(width: 25.w);
//               },
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Column(
//                   spacing: 16,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       orderEntity.getFirtstProduct().productEntity!.description ??
//                           "",
//                       style: AppStyles.style15Normal,
//                     ),
//                     Row(
//                       spacing: 8,
//                       children: [
//                         DottedBorder(
//                           options: const RoundedRectDottedBorderOptions(
//                             color: Colors.black,
//                             strokeWidth: 1,
//                             dashPattern: [4, 3],
//                             radius: Radius.circular(4),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 2,
//                             ),
//                             child: Text(
//                               orderEntity.orderDetails.first.size!,
//                               style: AppStyles.style15Normal.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         CircleAvatar(
//                           radius: 3.5.w,
//                           backgroundColor: hexToColor(
//                             orderEntity.getFirtstProduct().color!,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       getDiffTime(orderEntity.createdAt!),
//                       style: AppStyles.style15Normal,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (orderEntity.status == OrderStatus.pending)
//               Column(
//                 spacing: 8,
//                 children: [
//                   Assets.images.home.orderInProgress.image(),
//                   Text(
//                     LanguageProvider.translate("global", "in_progress"),
//                     style: AppStyles.style13Normal.copyWith(color: Colors.blue),
//                   ),
//                 ],
//               ),
//             if (orderEntity.status == OrderStatus.accepted)
//               Column(
//                 spacing: 8,
//                 children: [
//                   Assets.images.home.orderAccepted.image(),
//                   Text(
//                     LanguageProvider.translate("global", "order_accepted"),
//                     style: AppStyles.style13Normal.copyWith(color: Colors.green),
//                   ),
//                 ],
//               ),
//             if (orderEntity.status == OrderStatus.delivery)
//               Column(
//                 spacing: 8,
//                 children: [
//                   Assets.images.home.orderDelivered.image(),
//                   Text(
//                     LanguageProvider.translate("global", "order_delivered"),
//                     style: AppStyles.style13Normal.copyWith(color: Colors.black),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
