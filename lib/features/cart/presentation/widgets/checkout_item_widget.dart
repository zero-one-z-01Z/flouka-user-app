import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/cart_entity.dart';
import 'checkout_count_widget.dart';

class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({super.key, required this.cartEntity});
  final List<CartEntity> cartEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navPop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300,width: 1.2)
        ),
        child: Column(
          spacing: 1.h,
          children: List.generate(cartEntity.length, (index) {
            return Row(
              children: [
                Expanded(child: Text(cartEntity[index].product?.title ?? "",style: TextStyleClass.normalStyle(),),),
                Text("x${cartEntity[index].quantity}",style: TextStyleClass.normalStyle(color: Colors.grey),)
              ],
            );
          },)
        ),
      ),
    );
  }
}


//Container(
//         padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h, bottom: 4.h),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           spacing: 3.h,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const CheckoutCountWidget(),
//                 Icon(Icons.arrow_forward_ios, size: 15.sp),
//               ],
//             ),
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xffeffbff),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CachedNetworkImage(
//                     width: 20.w,
//                     imageUrl:
//                         cartEntity.product?.image ?? "https://placehold.co/600x400",
//                     errorWidget: (context, url, error) => const Icon(Icons.error),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       spacing: 1.h,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           cartEntity.product?.title ?? "",
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           style: TextStyleClass.normalStyle().copyWith(
//                             color: const Color(0xff333542),
//                           ),
//                         ),
//                         Row(
//                           spacing: 4,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             PriceWidget(
//                               price: (convertDataToNum(cartEntity.subTotal.toStringAsFixed(2)) ?? 999),
//                             ),
//                             const Spacer(),
//                             CustomStarRatingWidget(rating: cartEntity.product?.rate ?? 0, readOnly: true,),
//                             Text(
//                               "${cartEntity.product?.rate}",
//                               style: TextStyleClass.smallStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )