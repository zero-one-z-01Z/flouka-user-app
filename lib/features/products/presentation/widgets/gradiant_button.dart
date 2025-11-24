import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:sizer/sizer.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: "https://placehold.co/600x400/000000/FFFFFF/png",
              width: 5.w,
            ),
            Text(
              text,
              style: TextStyleClass.normalStyle().copyWith(
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(width: 2.w),
          ],
        ),
      ),
    );
  }
}
