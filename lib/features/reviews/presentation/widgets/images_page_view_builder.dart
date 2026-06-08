import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../products/domain/entity/product_review_entity.dart';
import '../providres/review_provider.dart';

class ImagesPageViewBuilder extends StatelessWidget {
  const ImagesPageViewBuilder({super.key, required this.images});
  final List<ReviewImage> images;
  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return PageView(
      controller: reviewProvider.pageController,
      children: List.generate(
        images.length,
        (index) => CachedNetworkImage(
          imageUrl: "${images[index].image}",
          width: 100.w,
          height: 100.h,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
