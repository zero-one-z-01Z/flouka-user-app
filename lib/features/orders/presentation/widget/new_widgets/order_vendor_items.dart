import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_styles.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../reviews/presentation/providres/create_rate_provider.dart';
import '../../../domain/entity/order_entity.dart';

class OrderVendorItems extends StatelessWidget {
  const OrderVendorItems({super.key, required this.vendor, required this.orderId});
  final VendorOrderEntity vendor;
  final int orderId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(vendor.items!.length, (i){
          OrderItemEntity orderItem = vendor.items![i];
          ProductEntity product = orderItem.product!;
          return SizedBox(
            width: 90.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 9.h,
                      width: 9.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(image:product?.image !=null ?
                          CachedNetworkImageProvider(product!.image!) :const AssetImage(AppImages.logo),
                              fit: BoxFit.cover)
                      ),
                    ),
                    if(orderItem.canReviewProduct??false)ButtonWidget(onTap: (){
                      Provider.of<CreateRateProvider>(context,listen: false).gotoReviewPage(itemId: orderItem.productId!, orderId: orderId, product: true);
                    }, text: 'rate_store',takeSmallestWidth: true,height: 3.h,
                      textStyle: TextStyleClass.smallStyle(color: Colors.white),color: Colors.orangeAccent,),
                  ],
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? "",
                        style: TextStyleClass.normalStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        product.description ?? "",
                        style: TextStyleClass.normalStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                // GestureDetector(
                //   onTap: () {
                //     context.read<FavoriteProvider>().toggleFavorite(productEntity);
                //   },
                //   child: Consumer<FavoriteProvider>(
                //     builder: (context, provider, child) {
                //       bool isFav = provider.favoriteIds.contains(productEntity.id);
                //       return Icon(
                //         isFav ? Icons.favorite : Icons.favorite_border,
                //         color: isFav ? Colors.red : const Color(0xff666666),
                //         size: 26,
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
