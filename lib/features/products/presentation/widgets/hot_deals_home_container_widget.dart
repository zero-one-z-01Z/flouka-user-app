import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/price_widget.dart';
import 'package:flouka/features/cart/presentation/providers/cart_operation_provider.dart';
import 'package:flouka/features/cart/presentation/providers/cart_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../favorite/presentation/providers/favorite_provider.dart';
import '../../domain/entity/product_entity.dart';
import '../providers/products_details_provider.dart';


class HotDealsHomeContainerWidget extends StatelessWidget {
  HotDealsHomeContainerWidget({super.key, required this.product, this.isSimilar=false,this.width});
  final ProductEntity product;
  final bool isSimilar;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final cartOperations = Provider.of<CartProvider>(context);
    const double fillPercent = 56.23;
    const double fillStop = (100 - fillPercent) / 100;
    const List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return InkWell(
      onTap: () {
        Provider.of<ProductDetailsProvider>(context,listen: false).goToPage({
          'product_id': product.id,
          'is_similar': isSimilar,
        });
      },
      child: Column(
        children: [



          Container(
            width:width?? 43.w,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(product.discountPercentage != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          height: 5.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffDF0033),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                '${LanguageProvider.translate("home", "discount").
                                replaceFirst("*num*", "${product.discountPercentage?.toStringAsFixed(1)}")}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      InkWell(
                        onTap: () {
                          FavoriteProvider favoriteProvider = Provider.of(context, listen: false);
                          favoriteProvider.toggleFavorite(product);
                        },

                        child: Container(
                          width: 7.w,
                          height: 7.w,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Consumer<FavoriteProvider>(
                            builder: (context, provider, child) {
                              bool isFav = provider.favoriteIds.contains(product.id);
                              return Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.white,
                                size: 18,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),

                  Center(
                    child: Container(
                        height: 12.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:product.image!=null ?
                            CachedNetworkImageProvider(product.image!) :const AssetImage(AppImages.logo),
                            fit: BoxFit.cover),

                        ),
                      ),
                  ),
                  SizedBox(height: 0.5.h),
                  Container(
                    height: 0.1.h,
                    width: 100.w,
                    color:const Color(0xffCCA6CD).withOpacity(0.2),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    product.title ?? "",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    product.description ?? "",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,
                    color: Colors.grey),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      Flexible(child: PriceWidget(price:product.offerPrice ?? product.price ?? 0)),
                      SizedBox(width: 1.w),
                      if(product.offerPrice != null)
                      Flexible(
                        child: Text("${product.price.toString()} ${LanguageProvider.translate('global', 'currency')}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.tertiaryColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(78.4),
                              border: Border.all(color: const Color(0xffAD46FF),width: 2),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 2.w,),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_shopping_cart,color:const Color(0xffAD46FF),size: 4.w,),
                                SizedBox(width: 1.w),
                                Text(LanguageProvider.translate("buttons", "add_to_cart"),
                                  style: TextStyleClass.smallStyle(color: AppColor.primaryColor).copyWith(
                                    fontSize: 14.sp
                                  ),),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 1.5.h,
          //   left: 6.w,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 2.w),
          //     height: 5.w,
          //     decoration: BoxDecoration(
          //       color: const Color(0xff5A5A5A),
          //       borderRadius: const BorderRadius.only(
          //         topRight: Radius.circular(0),
          //         topLeft: Radius.circular(10),
          //         bottomLeft: Radius.circular(10),
          //         bottomRight: Radius.circular(20),
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.1),
          //           blurRadius: 4,
          //           offset: const Offset(0, 2),
          //         ),
          //       ],
          //     ),
          //     child: Center(
          //       child: FittedBox(
          //         child: Text(
          //           LanguageProvider.translate('global', 'best_seller'),
          //           style: TextStyle(
          //             fontSize: 11.sp,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
