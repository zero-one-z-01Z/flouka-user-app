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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(spacing: 3.w,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(products.length, (index) => HotDealsHomeContainerWidget(product: products[index])),
        ),
      ),
    );
  }
}
