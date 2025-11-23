import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';

class OrderInfoItemWidget extends StatelessWidget {
  const OrderInfoItemWidget({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 1.w,
        children: [
          Text(title, style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp)),
          Text(
            info,
            style: TextStyleClass.normalStyle(
              color: AppColor.primaryColor,
            ).copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
