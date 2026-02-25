import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/stores/presentation/widgets/store_stat_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/store_details_provider.dart';

class StoreDetailsSection extends StatelessWidget {
  const StoreDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final storeDetailsProvider = context.watch<StoreDetailsProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StoreStatItem(
            title: 'seller_ratings',
            value: storeDetailsProvider.storeDetailsEntity!.avgRating.toString(),
            icon: SvgWidget(svg: AppImages.star, color: Colors.amber, width: 5.w),
          ),
          StoreStatItem(
            title: 'customers',
            value: storeDetailsProvider.storeDetailsEntity!.customersCount
                .toString(),
          ),
          StoreStatItem(
            title: 'products',
            value: storeDetailsProvider.storeDetailsEntity!.productsCount.toString(),
          ),
        ],
      ),
    );
  }
}
