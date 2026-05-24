import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../categories/domain/entity/category_entity.dart';
import '../providers/filter_product_provider.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({super.key, required this.filter});

  final CategoryEntity filter;

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
          style: TextStyleClass.smallStyle(color: isSelected ? Colors.black : const Color(0xffAEB1C1)).copyWith(
            fontWeight: FontWeight.w500,fontSize: 14.5.sp
          ),
          child: Text(LanguageProvider.translate("global", filter.name)),
        ),
      ),
    );
  }
}
