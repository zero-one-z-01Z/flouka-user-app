import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryHomeContainerWidget extends StatelessWidget {
  const CategoryHomeContainerWidget({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    this.isSvg = false,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w400,
  });

  final String imageUrl;
  final String categoryName;
  final bool isSvg;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 22.w,
          height: 7.h,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSvg ? AppColor.primaryColor : Colors.grey.shade300,
              width: isSvg ? 6.sp : 0.sp,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Center(
            child: isSvg
                ? SvgWidget(svg: imageUrl, width: 8.w)
                : Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          categoryName,
          style: TextStyleClass.normalStyle().copyWith(
            fontSize: 14.sp,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
