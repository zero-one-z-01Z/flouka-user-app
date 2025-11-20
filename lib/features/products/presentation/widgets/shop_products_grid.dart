import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

import 'hot_deals_home_container_widget.dart';

class ShopProductsGrid extends StatelessWidget {
  const ShopProductsGrid({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final hotDeals = [
      {
        'imageUrl': 'https://picsum.photos/200',
        'title': 'Gaming Laptop',
        'priceAfter': 999.0,
        'priceBefore': 1299.0,
        'rating': 4.5,
      },
      {
        'imageUrl': 'https://picsum.photos/201',
        'title': 'Wireless Headphones',
        'priceAfter': 120.0,
        'priceBefore': 180.0,
        'rating': 4.2,
      },
      {
        'imageUrl': 'https://picsum.photos/202',
        'title': 'Smartphone',
        'priceAfter': 799.0,
        'priceBefore': 899.0,
        'rating': 4.8,
      },
      {
        'imageUrl': 'https://picsum.photos/203',
        'title': 'Tablet',
        'priceAfter': 499.0,
        'priceBefore': 599.0,
        'rating': 4.1,
      },
      {
        'imageUrl': 'https://picsum.photos/204',
        'title': 'Gaming Mouse',
        'priceAfter': 59.0,
        'priceBefore': 79.0,
        'rating': 4.4,
      },
      {
        'imageUrl': 'https://picsum.photos/205',
        'title': 'Mechanical Keyboard',
        'priceAfter': 150.0,
        'priceBefore': 199.0,
        'rating': 4.6,
      },
    ];

    return MasonryGridView.count(
      padding: padding ?? EdgeInsets.only(top: 3.h, bottom: 4.h),
      shrinkWrap: true,
      reverse: false,
      crossAxisCount: 2,
      mainAxisSpacing: 2.h,
      crossAxisSpacing: 3.w,
      itemCount: hotDeals.length,
      itemBuilder: (context, index) {
        final deal = hotDeals[index];

        // Vary image height per index to get a visible masonry/stair effect
        final heights = [10.h, 13.h, 11.5.h, 14.h];
        final imageHeight = heights[index % heights.length];

        // First row: give different top padding to each column
        double topPadding;
        if (index == 0) {
          topPadding = 0; // left item
        } else if (index == 1) {
          topPadding = 2.h; // right item a bit lower
        } else {
          topPadding = 0; // other rows normal
        }

        return Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: HotDealsHomeContainerWidget(
            imageUrl: deal['imageUrl'] as String,
            title: deal['title'] as String,
            priceAfterOffer: deal['priceAfter'] as double,
            priceBeforeOffer: deal['priceBefore'] as double,
            rating: deal['rating'] as double,
            imageHeight: imageHeight,
          ),
        );
      },
    );
  }
}
