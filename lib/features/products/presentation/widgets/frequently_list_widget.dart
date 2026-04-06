

import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'frequently_item_widget.dart';

class FrequentlyListWidget extends StatelessWidget {
  const FrequentlyListWidget({super.key, required this.relatedProducts});
  final List<ProductEntity> relatedProducts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 2.w,
        children: List.generate(relatedProducts.length,
                (index) => FrequentlyItemWidget(relatedProduct: relatedProducts[index])),
      ),
    );
  }
}
