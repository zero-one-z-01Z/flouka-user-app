import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flouka/features/products/presentation/providers/home_products_provider.dart';
import 'package:provider/provider.dart';

class FilterProductsWidget extends StatelessWidget {
  const FilterProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProductsProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: SizedBox(
            height: 4.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.filters.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final bool isSelected = index == provider.selectedIndex;
                return GestureDetector(
                  onTap: () {
                    provider.setSelectedIndex(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? Colors.black : const Color(0xffAEB1C1),
                      ),
                      child: Text(provider.filters[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
