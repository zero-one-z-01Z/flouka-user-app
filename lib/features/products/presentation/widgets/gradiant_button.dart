import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';

class gradiantButton extends StatelessWidget {
  const gradiantButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.gradiantcolors,
  });
  final String text;
  final VoidCallback onTap;
  final List<Color> gradiantcolors;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradiantcolors,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradiantcolors,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: SvgWidget(svg: Images.apple, width: 8.w, height: 8.w),
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Sold By ", style: TextStyleClass.smallStyle()),
                    SizedBox(width: 1.w),
                    Text(
                      "APPLESTORE",
                      style: TextStyleClass.smallStyle(color: AppColor.primaryColor),
                    ),
                  ],
                ),
                // SizedBox(height: 1.h),
                Row(
                  children: [
                    Text("4.6", style: TextStyleClass.smallStyle()),
                    RatingBar(
                      itemCount: 1,
                      itemSize: 16.sp,
                      initialRating: 1,
                      ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.amber),
                        half: const Icon(Icons.star_half, color: Colors.amber),
                        empty: const Icon(Icons.star_outline, color: Colors.amber),
                      ),
                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
