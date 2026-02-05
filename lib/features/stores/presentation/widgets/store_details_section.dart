import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/stores/presentation/widgets/store_stat_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StoreDetailsSection extends StatelessWidget {
  const StoreDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StoreStatItem(
            title: 'seller_ratings',
            value: '4.5',
            icon: SvgWidget(svg: AppImages.star, color: Colors.amber, width: 5.w),
          ),
          const StoreStatItem(title: 'customers', value: '20K+'),
          const StoreStatItem(title: 'products', value: '150+'),
        ],
      ),
    );
  }
}
