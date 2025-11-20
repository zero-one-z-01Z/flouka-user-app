import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'filtered_product_home_container_widget.dart';

class FilteredProductsHomeSection extends StatelessWidget {
  const FilteredProductsHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Fake products data for home section
    final products = [
      (
        image: 'https://placehold.co/200x200/00A8E1/FFFFFF/png?text=Product+1',
        title: 'Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB',
        price: 59.99,
        rating: 4.5,
      ),
      (
        image: 'https://placehold.co/200x200/2D2C2C/FFFFFF/png?text=Product+2',
        title: 'Smart Watch Series 9',
        price: 199.99,
        rating: 4.8,
      ),
      (
        image: 'https://placehold.co/200x200/FFC107/000000/png?text=Product+3',
        title: 'Gaming Laptop Pro',
        price: 1299.00,
        rating: 4.7,
      ),
    ];

    return Column(
      children: products
          .map(
            (product) => Padding(
              padding: EdgeInsets.symmetric(vertical: 0.8.h),
              child: FilteredProductHomeContainerWidget(
                imageUrl: product.image,
                title: product.title,
                price: product.price,
                rating: product.rating,
              ),
            ),
          )
          .toList(),
    );
  }
}
