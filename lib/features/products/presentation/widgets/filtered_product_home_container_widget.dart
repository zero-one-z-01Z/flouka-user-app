import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../favorite/presentation/providers/favorite_provider.dart';
import '../providers/products_details_provider.dart';

class FilteredProductHomeContainerWidget extends StatelessWidget {
  const FilteredProductHomeContainerWidget({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return InkWell(
      onTap: () => productDetailsProvider.goToPage({
        'product_id': productEntity.id,
        'is_similar': false,
      }),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE5E7EB)),
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     blurRadius: 2,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ).copyWith(top: 2.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                child: Container(
                  height: 12.h,
                  width: 12.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:productEntity.image !=null ?
                    CachedNetworkImageProvider(productEntity.image!) :const AssetImage(AppImages.logo))
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.title ?? "",
                      style: TextStyleClass.normalStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Text(
                          '\$${productEntity.offerPrice != null ? productEntity.offerPrice.toString() :  productEntity.price.toString()}',
                          style: TextStyleClass.normalStyle().copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        if(productEntity.offerPrice != null)...[
                          SizedBox(width: 1.w),
                          Text(
                            '\$${productEntity.price.toString()}',
                            style: TextStyleClass.normalStyle().copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                
                
                        // SizedBox(width: 13.w),
                        // RatingBarIndicator(
                        //   rating: (productEntity.rate ?? 0).toDouble(),
                        //   itemBuilder: (context, index) =>
                        //       const Icon(Icons.star, color: Colors.amber),
                        //   itemCount: 5,
                        //   itemSize: 20.0,
                        //   direction: Axis.horizontal,
                        // ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Container(width: 100.w,
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(78.4),
                      border: Border.all(color: const Color(0xffAD46FF),width: 2),
                    ),
                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_shopping_cart,color:  Color(0xffAD46FF),),
                        SizedBox(width: 2.w),
                        Text(LanguageProvider.translate("buttons", "add_to_cart"),
                          style: TextStyleClass.normalStyle(color: AppColor.primaryColor),),
                      ],
                    )),
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
        ),
      ),
    );
  }
}
