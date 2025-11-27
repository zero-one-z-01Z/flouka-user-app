import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchbarContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 5.h,
      margin: margin,
      decoration: BoxDecoration(
        color: fillColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: CustomPaint(
        painter: GradientBorderPainter(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color(0xFF00A8E1),
              const Color(0xffA6E7CF).withOpacity(0.77),
            ],
          ),
          strokeWidth: 1,
          radius: 6,
        ),
        child: TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          autofocus: autoFocus,
          style: TextStyleClass.normalStyle(),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText:
                hintText ?? LanguageProvider.translate('categories', 'search'),
            hintStyle: TextStyleClass.normalStyle(
              color: AppColor.primaryColor,
            ).copyWith(fontSize: 15.sp),
            prefixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: const SvgWidget(
                svg: Images.search,
                color: Color(0xff7A7979),
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(3.w),
              child: suffixIcon,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 1.3.h),
          ),
        ),
      ),
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
