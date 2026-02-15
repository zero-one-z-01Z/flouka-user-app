import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sizer/sizer.dart';

import '../../../filters/presentation/providers/filter_product_provider.dart';
import 'filtered_product_home_container_widget.dart';

class FilteredProductsHomeSection extends StatelessWidget {
  const FilteredProductsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProductProvider>(
      builder: (context, provider, child) => provider.isLoading
          ? const LoadingProductsListWidget()
          : Column(
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

class LoadingProductsListWidget extends StatelessWidget {
  const LoadingProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FilterProductProvider>();
    return Column(
      children: List.generate(
        1,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 0.8.h),
          child: Skeletonizer(
            enabled: provider.isLoading,
            child: FilteredProductHomeContainerWidget(
              productEntity: provider.fakeProduct,
            ),
          ),
        ),
      ),
    );
  }
}
//  padding: EdgeInsets.symmetric(vertical: 0.8.h),