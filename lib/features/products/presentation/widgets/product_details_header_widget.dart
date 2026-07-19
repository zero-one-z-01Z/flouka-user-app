import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/circle_action_button_widget.dart';
import '../../../favorite/presentation/providers/favorite_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/product_entity.dart';
import '../providers/products_details_provider.dart';
import 'custom_product_details_dots_indicators.dart';
import 'hot_deals_home_container_widget.dart';

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
              Positioned.fill(
                child: CarouselSlider(
                  items: productDetailsProvider.images().map((item) {
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
                  controller: productDetailsProvider.controller,
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      productDetailsProvider.changeImageIndex(index: index);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 3.h,
                right: 2.w,
                child: Column(
                  spacing: 2.h,
                  children: [
                    InkWell(onTap: ()async{
                      String url = '${Constants.baseUri}product?id=${productEntity.id}';
                      final box = context.findRenderObject() as RenderBox?;
                      await Share.share("${LanguageProvider.translate('settings', 'share_description')
                          .replaceFirst("*product*", "${productEntity.title}")
                          .replaceFirst("*description*", "${productEntity.description}")}\n$url",
                        sharePositionOrigin: Constants.isTablet?
                        (box!.localToGlobal(Offset.zero) & box.size):null,);
                    },child: const CircleActionButtonWidget(svgImage: AppImages.share,color: Colors.black,)),
                    InkWell(
                      onTap: () {
                        FavoriteProvider favoriteProvider = Provider.of(context, listen: false);
                        favoriteProvider.toggleFavorite(productEntity);
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
                            bool isFav = provider.favoriteIds.contains(productEntity.id);
                            return Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                              size: 25,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // the dots indicators of number of images
        SizedBox(height: 0.5.h,),
        CustomProductDetailsDotsIndicators(imagesList: productEntity.images,),

      ],
    );
  }
}
