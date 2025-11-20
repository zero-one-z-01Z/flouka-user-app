// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:raval/features/orders/domain/entity/order_details_entity.dart';
// import 'package:sizer/sizer.dart';

// import '../../../../core/config/app_styles.dart';
// import '../../../../core/constants/assets.gen.dart';
// import '../../../../core/helper_function/convert.dart';
// import '../../../../core/widgets/price_widget.dart';

// class OrderDetailsItemWidget extends StatelessWidget {
//   const OrderDetailsItemWidget({super.key, required this.orderDetailsEntity});
//   final OrderDetailsEntity orderDetailsEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CachedNetworkImage(
//             width: 20.w,
//             imageUrl: orderDetailsEntity.productEntity!.image!,
//             errorWidget: (context, url, error) =>
//                 Assets.images.home.cartImage.image(),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               child: Column(
//                 spacing: 16,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(orderDetailsEntity.productEntity!.name!, style: AppStyles.style15Normal),
//                   Row(
//                     spacing: 8,
//                     children: [
//                       DottedBorder(
//                         options: const RoundedRectDottedBorderOptions(
//                           color: Colors.black,
//                           strokeWidth: 1,
//                           dashPattern: [4, 3],
//                           radius: Radius.circular(4),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 2,
//                           ),
//                           child: Text(
//                             orderDetailsEntity.size!,
//                             style: AppStyles.style15Normal.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       CircleAvatar(
//                         radius: 3.5.w,
//                         backgroundColor: hexToColor(orderDetailsEntity.color!),
//                       ),
//                       const Spacer(),
//                       PriceWidget(price: convertDataToNum(orderDetailsEntity.productEntity!.price)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
