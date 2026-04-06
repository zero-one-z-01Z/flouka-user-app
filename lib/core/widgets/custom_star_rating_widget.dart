import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class CustomStarRatingWidget extends StatelessWidget {
  const CustomStarRatingWidget({super.key, this.itemSize, required this.rating,  this.readOnly =false});
  final double? itemSize;
  final num rating;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      maxRating: 5,
      initialRating: rating.toDouble(),
      ignoreGestures: readOnly,
      itemSize: itemSize ?? 18.sp,
      allowHalfRating: true,
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.amber),
        half: const Icon(Icons.star_half, color: Colors.amber),
        empty: const Icon(Icons.star_border, color: Colors.amber),
      ),
      onRatingUpdate: (value) {},
    );
  }
}
