import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../filters/presentation/providers/filter_product_provider.dart';
import 'filtered_product_home_container_widget.dart';

class FilteredProductsHomeSection extends StatelessWidget {
  const FilteredProductsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProductProvider>(
      builder: (context, provider, child) => Column(
        children: List.generate(
          provider.products?.length ?? 0,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: FilteredProductHomeContainerWidget(
              productEntity: provider.products![index],
            ),
          ),
        ),
      ),
    );
  }
}


//  padding: EdgeInsets.symmetric(vertical: 0.8.h),