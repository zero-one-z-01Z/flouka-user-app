import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../providers/products_details_provider.dart';

class FilteredProductHomeContainerWidget extends StatelessWidget {
  const FilteredProductHomeContainerWidget({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return InkWell(
      onTap: () => productDetailsProvider.goToPage(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        height: 12.h,
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ).copyWith(top: 2.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: productEntity.image ?? "",
                height: 12.h,
                width: 12.h,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 4.h,
                    child: Text(
                      productEntity.title ?? "",
                      style: TextStyleClass.normalStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Text(
                        '\$${productEntity.price.toString()}',
                        style: TextStyleClass.normalStyle().copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(width: 13.w),
                      RatingBarIndicator(
                        rating: productEntity.avgRating ?? 0,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.favorite, color: AppColor.tertiaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
