import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/circle_action_button_widget.dart';
import '../../domain/entity/product_entity.dart';
import '../providers/products_details_provider.dart';
import 'custom_product_details_dots_indicators.dart';

class ProductDetailsHeaderWidget extends StatelessWidget {
  const ProductDetailsHeaderWidget({super.key,required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return Column(
      children: [
        Container(
          height: 30.h,width: 100.w,
          child: Stack(
            children: [
              CarouselSlider(
                items: productEntity.images.map((item) {
                  return InkWell(
                    onTap: () {
                    },
                    child: Container(
                      height: 35.h,width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    productDetailsProvider.changeImageIndex(index: index);
                  },
                ),
              ),
              Positioned(
                top: 3.h,
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
        ),
        // the dots indicators of number of images
        CustomProductDetailsDotsIndicators(imagesList: productEntity.images,),

      ],
    );
  }
}
