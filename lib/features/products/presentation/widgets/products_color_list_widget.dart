import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/products_details_provider.dart';
import 'product_details_color_widget.dart';

class ProductColorsListWidget extends StatelessWidget {
  const ProductColorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.h,
      children: List.generate(productDetailsProvider.colorsList.length, (index) {
        return ProductDetailsColorWidget(
          color: productDetailsProvider.colorsList[index],
        );
      }),
    );
  }
}
