import 'package:flouka/features/products/presentation/providers/home_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'filtered_product_home_container_widget.dart';

class FilteredProductsHomeSection extends StatelessWidget {
  const FilteredProductsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProductsProvider>(
      builder: (context, provider, child) => Column(
        children: List.generate(
          provider.productsList.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: FilteredProductHomeContainerWidget(
              productEntity: provider.productsList[index],
            ),
          ),
        ),
      ),
    );
  }
}


//  padding: EdgeInsets.symmetric(vertical: 0.8.h),