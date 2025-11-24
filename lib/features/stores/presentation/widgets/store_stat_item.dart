import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';

class StoreStatItem extends StatelessWidget {
  final String title;
  final String value;
  final Widget? icon;

  const StoreStatItem({
    super.key,
    required this.title,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      width: 29.w,

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageProvider.translate('global', title),
            style: TextStyleClass.smallStyle().copyWith(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyleClass.headStyle().copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icon != null) ...[SizedBox(width: 1.w), icon!],
            ],
          ),
        ],
      ),
    );
  }
}
