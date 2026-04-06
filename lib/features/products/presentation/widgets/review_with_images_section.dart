import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/img_preview_widget.dart';
import '../../../../core/widgets/imgs_preview_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../reviews/presentation/providres/review_provider.dart';
import '../../domain/entity/product_entity.dart';

class ReviewWithImagesSection extends StatelessWidget {
  const ReviewWithImagesSection({super.key, required this.reviewImages});
  final List<ProductImage> reviewImages;
  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate("global", "Review With Imges"),
          style: TextStyleClass.normalStyle(),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: 100.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 2.w,
              children: List.generate(
                reviewImages.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: InkWell(
                    onTap: () {
                      navP(ImagesPreviewWidget(
                        images: reviewImages,
                        index: index,
                      ));
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: "${reviewImages[index].image}",
                          width: 20.w,
                          height: 20.w,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
