import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key, this.textColor});
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(
                  "https://placehold.co/600x400/000000/FFFFFF/png",
                ),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3omran el m4t4t",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      RatingBar(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half: const Icon(Icons.star_half, color: Colors.amber),
                          empty: const Icon(Icons.star_outline, color: Colors.amber),
                        ),
                        onRatingUpdate: (_) {},
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '(${3.5})',
                        style: TextStyle(fontSize: 12, color: textColor),
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
            "this laptolaptop has been working out for me and my car and I was going over to see if you can come in tomorrow I ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor ?? Colors.black,
              height: 2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "2 days ago",
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
