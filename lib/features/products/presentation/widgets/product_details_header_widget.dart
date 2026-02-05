import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/products/presentation/widgets/products_color_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/circle_action_button_widget.dart';
import '../providers/products_details_provider.dart';
import 'custom_product_details_dots_indicators.dart';

class ProductDetailsHeaderWidget extends StatelessWidget {
  const ProductDetailsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return SizedBox(
      width: 100.w,
      height: 40.h,
      child: Stack(
        children: [
          // Images of the product
          PageView.builder(
            controller: productDetailsProvider.pageController,
            itemCount: productDetailsProvider.data!.images!.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: productDetailsProvider.data!.images![index]!.image,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
          // the dots indicators of number of images
          Positioned.fill(
            bottom: -35.h,
            child: const Align(
              alignment: Alignment.center,
              child: CustomProductDetailsDotsIndicators(),
            ),
          ),
          // the colors list
          Positioned(
            bottom: 10.h,
            left: 5.w,
            child: const ProductColorsListWidget(),
          ),
          // the share and favourite buttons
          Positioned(
            top: 5.h,
            right: 5.w,
            child: Column(
              spacing: 2.h,
              children: [
                const CircleActionButtonWidget(svgImage: AppImages.share),
                const CircleActionButtonWidget(svgImage: AppImages.heart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
