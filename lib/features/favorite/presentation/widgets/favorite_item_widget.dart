import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../features/cart/presentation/providers/cart_operation_provider.dart';
import '../../../../features/cart/presentation/providers/cart_provider.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../../products/presentation/providers/products_details_provider.dart';
import '../../../products/presentation/widgets/hot_deals_home_container_widget.dart';
import '../providers/favorite_provider.dart';

class FavoriteItemWidget extends StatelessWidget {
  final ProductEntity product;

  const FavoriteItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return InkWell(
      onTap: (){
        context.read<ProductDetailsProvider>().goToPage({'product_id':product.id});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffF0F0F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                    imageUrl: product.image ?? "",
                    errorWidget: (context, url, error) => Container(
                      width: 20.w,
                      height: 20.w,
                      color: const Color(0xffF5F5F5),
                      child: const Icon(Icons.image_outlined, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? "",
                        style: TextStyleClass.normalStyle().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // if(product.selectedPrice()!=null)PriceWidget(
                      //   price: product.selectedPrice() ?? 35,
                      //   fontStyle: TextStyleClass.normalStyle().copyWith(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 14.sp,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ],
            ),
            PositionedDirectional(
              start: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  favoriteProvider.toggleFavorite(product);
                },
                child: Consumer<FavoriteProvider>(
                  builder: (context, provider, child) {
                    bool isFav = provider.favoriteIds.contains(product.id);
                    return Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : const Color(0xff666666),
                      size: 26,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
