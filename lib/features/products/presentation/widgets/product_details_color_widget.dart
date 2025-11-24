import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsColorWidget extends StatelessWidget {
  const ProductDetailsColorWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of(context);

    bool isSelected = productDetailsProvider.isColorSelected(color);
    return InkWell(
      onTap: () {
        productDetailsProvider.onColorChange(color);
      },
      child: CircleAvatar(
        radius: 14,
        backgroundColor: isSelected ? const Color(0xffe2ecf3) : Colors.transparent,
        child: CircleAvatar(radius: 10, backgroundColor: color),
      ),
    );
  }
}
