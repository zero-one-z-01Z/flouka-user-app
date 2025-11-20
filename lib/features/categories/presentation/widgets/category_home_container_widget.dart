import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryHomeContainerWidget extends StatelessWidget {
  const CategoryHomeContainerWidget({
    super.key,
    this.ishome = true,
    this.isSvg = true,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w400,
    required this.category,
    required this.showText,
  });

  final CategoryEntity category;
  final bool isSvg;
  final Color textColor;
  final FontWeight fontWeight;
  final bool showText;
  final bool ishome;

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
            child: ishome
                ? isSvg
                      ? SvgWidget(svg: category.image, width: 8.w)
                      : Image.network(category.image, fit: BoxFit.contain)
                : Image.network(category.image, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 1.h),
        showText
            ? SizedBox(
          width: 20.w,
              child: Text(
                  category.name,
                  style: TextStyleClass.normalStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                textAlign: TextAlign.center,
                ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }
}
