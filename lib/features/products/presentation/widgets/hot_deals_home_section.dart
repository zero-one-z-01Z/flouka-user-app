import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'hot_deals_home_container_widget.dart';

class HotDealsHomeSection extends StatelessWidget {
  const HotDealsHomeSection({super.key});

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
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Deals',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: navigate to all hot deals
                  },
                  child: Text(
                    LanguageProvider.translate('home', 'see_all'),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.tertiaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 24.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotDeals.length,
              itemBuilder: (context, index) {
                final deal = hotDeals[index];
                return HotDealsHomeContainerWidget(
                  imageUrl: deal['imageUrl'] as String,
                  title: deal['title'] as String,
                  priceAfterOffer: deal['priceAfter'] as double,
                  priceBeforeOffer: deal['priceBefore'] as double,
                  rating: deal['rating'] as double,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
