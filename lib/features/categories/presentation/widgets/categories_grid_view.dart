import 'package:flutter/material.dart';
import 'package:flouka/features/categories/domain/entity/category_entity.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/widgets/category_image_container_widget.dart';
import 'package:flouka/features/categories/presentation/widgets/subcategories_listview.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        final List<CategoryEntity> categories = provider.categories;

        if (categories.isEmpty && provider.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (categories.isEmpty) {
          return const SizedBox.shrink();
        }
        final subcategoryProvider = context.watch<SubcategoryProvider>();
        const crossAxisCount = 3;
        final rowCount = (categories.length / crossAxisCount).ceil();

        int? selectedRow;
        if (subcategoryProvider.categoryId != null) {
          final selectedIndex = categories.indexWhere(
            (c) => c.id == subcategoryProvider.categoryId,
          );
          if (selectedIndex != -1) {
            selectedRow = selectedIndex ~/ crossAxisCount;
          }
        }

        final List<Widget> rows = [];

        for (int row = 0; row < rowCount; row++) {
          final List<Widget> rowChildren = [];

          for (int col = 0; col < crossAxisCount; col++) {
            final index = row * crossAxisCount + col;
            if (index >= categories.length) break;

            final category = categories[index];

            final isLastInRow =
                (col == crossAxisCount - 1) || (index == categories.length - 1);

            rowChildren.add(
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: isLastInRow ? 0.0 : 12.0),
                  child: GestureDetector(
                    onTap: () {
                      if (subcategoryProvider.categoryId == category.id &&
                          subcategoryProvider.subcategories.isNotEmpty) {
                        subcategoryProvider.clear();
                      } else {
                        subcategoryProvider.getSubcategories(category);
                      }
                    },
                    child: CategoryImageContainerWidget(category: category),
                  ),
                ),
              ),
            );
          }

          rows.add(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: rowChildren,
            ),
          );

          if (selectedRow == row &&
              subcategoryProvider.subcategories.isNotEmpty) {
            // Small gap between categories row and its subcategories
            rows.add(const SubcategoriesListView());

            // Larger gap between subcategories and the next categories row
            if (row != rowCount - 1) {
              rows.add(SizedBox(height: 4.h));
            }
          } else {
            // Default gap between category rows when no subcategories are shown here
            if (row != rowCount - 1) {
              rows.add(const SizedBox(height: 12));
            }
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rows,
        );
      },
    );
  }
}
