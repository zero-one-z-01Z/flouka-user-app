import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../products/presentation/widgets/review_widget.dart';

class RatingBottomSheetWidget extends StatelessWidget {
  const RatingBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(41),
          topRight: Radius.circular(41),
        ),
      ),
      child: Container(
        // Add your content here
        child: Column(
          children: [
            SizedBox(height: 5.h),
            const ReviewItemWidget(textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
