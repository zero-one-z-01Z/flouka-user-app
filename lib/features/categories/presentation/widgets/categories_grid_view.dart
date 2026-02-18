import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/categories_provider.dart';
import '../providers/subcategory_provider.dart';
import '../widgets/category_image_container_widget.dart';
import '../widgets/subcategories_listview.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoryProvider, SubcategoryProvider>(
      builder: (context, categoryProvider, subcategoryProvider, child) {
        if (categoryProvider.isLoading && categoryProvider.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (categoryProvider.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        final categories = categoryProvider.categories;
        final rows = <Widget>[];
        const int itemsPerRow = 3;

        for (int i = 0; i < categories.length; i += itemsPerRow) {
          final rowCategories = categories.skip(i).take(itemsPerRow).toList();

          // Check if the selected category is in this specific row
          final bool isSubcategoryOpenInThisRow = rowCategories.any(
            (cat) => subcategoryProvider.categoryId == cat.id,
          );

          rows.add(
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(itemsPerRow, (index) {
                    if (index < rowCategories.length) {
                      final category = rowCategories[index];
                      final isSelected =
                          subcategoryProvider.categoryId == category.id;

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              subcategoryProvider.clear();
                            } else {
                              subcategoryProvider.getSubcategories(category);
                            }
                          },
                          child: CategoryImageContainerWidget(category: category),
                        ),
                      );
                    } else {
                      // Spacer for empty slots in the last row to maintain grid alignment
                      return const Expanded(child: SizedBox.shrink());
                    }
                  }),
                ),

                // Subcategories logic
                if (isSubcategoryOpenInThisRow) ...[
                  SizedBox(
                    height: 0.5.h,
                  ), // Smaller spacing between row and its subcategories
                  const SubcategoriesListView(),
                  SizedBox(
                    height: 2.h,
                  ), // Larger spacing after subcategories before next row
                ] else ...[
                  SizedBox(height: 1.5.h), // Normal spacing between rows
                ],
              ],
            ),
          );
        }

        return Column(children: rows);
      },
    );
  }
}
