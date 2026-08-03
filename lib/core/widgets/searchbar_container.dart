import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../features/products/presentation/providers/categories_product_search_provider.dart';

class SearchbarContainer extends StatefulWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final VoidCallback? onChanged;
  final String? hintText;
  final bool readOnly;
  final bool autoFocus;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;

  const SearchbarContainer({
    super.key,
    this.onTap,
    this.controller,
    this.onChanged,
    this.hintText,
    this.readOnly = true,
    this.autoFocus = false,
    this.suffixIcon,
    this.margin,
    this.fillColor,
  });

  @override
  State<SearchbarContainer> createState() => _SearchbarContainerState();
}

class _SearchbarContainerState extends State<SearchbarContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5.h,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: widget.fillColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: CustomPaint(
            painter: GradientBorderPainter(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColor.primaryColor,
                  const Color(0xffA6E7CF).withOpacity(0.77),
                ],
              ),
              strokeWidth: 1,
              radius: 6,
            ),
            child: TextField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              onChanged: (s){
                if(widget.onChanged !=null){
                  widget.onChanged!();
                }
                setState(() {

                });
              },
              autofocus: widget.autoFocus,
              style: TextStyleClass.normalStyle(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                // hintText: hintText ?? LanguageProvider.translate('categories', 'search'),
                hintStyle: TextStyleClass.normalStyle(
                  color: AppColor.primaryColor,
                ).copyWith(fontSize: 15.sp),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(3.w),
                  child:  SvgWidget(
                    svg: AppImages.search,
                    color:const Color(0xff7A7979),width: 6.w,fit: BoxFit.contain,
                  ),
                ),
                suffixIcon: Padding(padding: EdgeInsets.all(3.w), child: widget.suffixIcon),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 1.3.h),
              ),
            ),
          ),
        ),
        if (widget.controller!.text.isEmpty) PositionedDirectional(
          start: 12.w,
          top: 0,
          bottom: 0,
          child: Center(
            child: IgnorePointer(
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 800),
                animatedTexts: CategoriesProductSearchProvider.searchHints.map((e){
                  return TypewriterAnimatedText(
                    e,
                    speed: const Duration(milliseconds: 80),
                  );
                }).toList(),
              ),
            ),
          ),

        ),
      ],
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;

  GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
