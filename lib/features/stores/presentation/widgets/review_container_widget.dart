import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/helper_function/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../products/domain/entity/product_review_entity.dart';
import '../providers/store_reviews_provider.dart';

class ReviewContainerWidget extends StatelessWidget {
  final ProductReviewEntity review;
  const ReviewContainerWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final reviewsProvider = context.read<StoreReviewsProvider>();
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(review.user.image),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      RatingBar(
                        initialRating: review.rating.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          empty: const Icon(Icons.star, color: Colors.grey),
                        ),
                        onRatingUpdate: (_) {},
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '(${review.rating})',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              getDiffTime(review.createdAt),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.4),
        ],
      ),
    );
  }
}
