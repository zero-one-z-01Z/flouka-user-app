import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'delivery_dropdown_widget.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 1.h,
      ).copyWith(top: 7.h),
      child: Row(
        children: [
          const DeliveryDropdownWidget(),
          const Spacer(),
          SvgWidget(svg: Images.cart, onTap: () {}),
          SizedBox(width: 4.w),
          SvgWidget(svg: Images.search, onTap: () {}),
        ],
      ),
    );
  }
}
