import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entity/filter_entity.dart';
import '../providers/filter_product_provider.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({super.key, required this.filter});

  final FilterEntity filter;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FilterProductProvider>();
    final bool isSelected = provider.isSelected(filter);
    return GestureDetector(
      onTap: () {
        provider.setSelectedIndex(filter);
        provider.getFilterProducts(filter.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.black : const Color(0xffAEB1C1),
          ),
          child: Text(filter.title),
        ),
      ),
    );
  }
}
