import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';

class AvgRatingWidget extends StatelessWidget {
  const AvgRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "3.6",
          style: TextStyleClass.headStyle(
            color: Colors.black,
          ).copyWith(fontWeight: FontWeight.bold, fontSize: 26.sp),
        ),
        SizedBox(width: 2.w),
        CustomStarRatingWidget(itemSize: 23.sp),
      ],
    );
  }
}
