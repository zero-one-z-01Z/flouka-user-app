import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'hot_deals_home_container_widget.dart';

class HotDealsHomeSection extends StatelessWidget {
  const HotDealsHomeSection({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return HotDealsHomeContainerWidget(
                  product: product,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
