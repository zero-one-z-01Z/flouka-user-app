import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/loading_widget.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../products/domain/entity/product_entity.dart';

class ProductBannerWidget extends StatelessWidget {
  const ProductBannerWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final bannerProvider = context.watch<BannersProvider>();

    if (bannerProvider.bannersList.isEmpty) {
      return const Center(child: LoadingWidget());
    }

    return Column(
      children: [
        Center(
          child: Container(
            width: 90.w,
            height: 25.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: CarouselSlider(
              items: productEntity.images!.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: item!.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  bannerProvider.changeIndex(index);
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 1.h),

        // ✅ Fixed indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            productEntity.images!.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
              height: 1.h,
              width: bannerProvider.currentIndex == index ? 6.w : 3.w,
              decoration: BoxDecoration(
                color: bannerProvider.currentIndex == index
                    ? AppColor.primaryColor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
