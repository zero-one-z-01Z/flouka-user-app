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
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.7.h),
      width: 25.w,

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        color: Colors.grey.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyleClass.headStyle().copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icon != null) ...[SizedBox(width: 1.w), icon!],
            ],
          ),
          Text(
            LanguageProvider.translate('global', title),
            style: TextStyleClass.smallStyle().copyWith(
              color: Colors.black,
              fontSize: 15.sp,height: 1
            ),
          ),

        ],
      ),
    );
  }
}
