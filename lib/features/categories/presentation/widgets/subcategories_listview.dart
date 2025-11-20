import 'package:flouka/features/categories/domain/entity/subcategory_entity.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/widgets/subcategory_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubcategoriesListView extends StatelessWidget {
  const SubcategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubcategoryProvider>(
      builder: (context, provider, _) {
        final List<SubcategoryEntity> subcategories = provider.subcategories;

        if (subcategories.isEmpty && provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (subcategories.isEmpty) {
          return const SizedBox.shrink();
        }

        final itemCount = subcategories.length + 1; // last one is "view all"

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (_, __) => SizedBox(height: 1.h),
          itemBuilder: (context, index) {
            if (index == itemCount - 1) {
              // Last tile: View all
              return const SubcategoryTile(isAll: true);
            }

            final subcategory = subcategories[index];
            return SubcategoryTile(subcategory: subcategory);
          },
        );
      },
    );
  }
}
