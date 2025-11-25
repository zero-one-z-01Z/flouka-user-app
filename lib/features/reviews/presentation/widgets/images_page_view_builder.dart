import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providres/review_provider.dart';

class ImagesPageViewBuilder extends StatelessWidget {
  const ImagesPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return PageView(
      controller: reviewProvider.pageController,
      children: List.generate(
        4,
        (index) => CachedNetworkImage(
          imageUrl: "https://placehold.co/600x400/000000/FFFFFF/png",
          width: 100.w,
          height: 100.h,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
