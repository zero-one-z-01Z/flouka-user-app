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
import '../../domain/entity/product_entity.dart';

class HotDealsHomeContainerWidget extends StatelessWidget {
  HotDealsHomeContainerWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final cartOperations = Provider.of<CartProvider>(context);
    const double fillPercent = 56.23;
    const double fillStop = (100 - fillPercent) / 100;
    const List<double> stops = [0.0, fillStop, fillStop, 1.0];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          width: 43.w,
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
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: product.image ?? "",
                    width: double.infinity,
                    height: 10.h,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 0.6.h),
                Row(
                  children: [
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
                            '3% Off',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Expanded(
                      child: Text(
                        LanguageProvider.translate('global', 'white_friday_deal'),
                        style: TextStyleClass.normalStyle().copyWith(
                          color: AppColor.DealColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.6.h),
                Row(
                  children: [
                    Flexible(child: PriceWidget(price: product.price ?? 0)),
                    SizedBox(width: 1.w),
                    Flexible(
                      child: Text(
                        product.offerPrice.toString(),
                        style: TextStyle(
                          fontSize: 11.sp,
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
                Text(
                  product.title ?? "",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.2.h),
                // Row(
                //   children: [
                //     const SvgWidget(svg: AppImages.star),
                //     Text(rating.toString()),
                //   ],
                // ),
                SizedBox(height: 0.5.h),
                if (true)
                  Container(
                    width: 32.w,
                    height: 5.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.primaryColor,
                          Colors.black,
                          Colors.black,
                        ],
                        stops: stops,
                        end: Alignment.centerLeft,
                        begin: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          "${LanguageProvider.translate('global', 'made_in')}  China",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 1.h,
          right: 4.w,
          child: InkWell(
            onTap: () {
              cartOperations.addToCart(productId: product.id!);
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
              child: Icon(Icons.add, size: 4.w, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 1.5.h,
          left: 6.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            height: 5.w,
            decoration: BoxDecoration(
              color: const Color(0xff5A5A5A),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  LanguageProvider.translate('global', 'best_seller'),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
