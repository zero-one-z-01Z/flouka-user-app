import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 3.h,
        ).copyWith(top: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgWidget(svg: Images.cart, onTap: () {}),
                SizedBox(width: 4.w),
                SvgWidget(svg: Images.search, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
