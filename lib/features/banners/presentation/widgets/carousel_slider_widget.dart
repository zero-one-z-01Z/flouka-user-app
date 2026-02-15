import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/helper_function/contact.dart';
import '../provider/banners_provider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerProvider = context.watch<BannersProvider>();

    if (bannerProvider.bannersList.isEmpty) {
      return const SizedBox(height: 8);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          SizedBox(
            width: 90.w,
            height: 15.h,
            child: CarouselSlider(
              items: bannerProvider.bannersList.map((item) {
                return InkWell(
                  onTap: () {
                    if (item.link != null) {
                      launchLink(item.link!);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
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
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
