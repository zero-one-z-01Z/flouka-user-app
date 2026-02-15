import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import '../providers/filter_product_provider.dart';
import 'filter_item_widget.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProductProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Row(
            children: [
              ...List.generate(provider.filters.length, (index) {
                return FilterItemWidget(filter: provider.filters[index]);
              }),
            ],
          ),
        );
      },
    );
  }
}
