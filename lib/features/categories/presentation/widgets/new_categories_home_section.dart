import 'package:flouka/features/categories/presentation/widgets/new_categories_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/popular_categoey_provider.dart';

class NewCategoriesHomeSection extends StatelessWidget {
  const NewCategoriesHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.read<HomeCategoreyProvider>().homeCategories;
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: SizedBox(
        height: 145, // Adjust this height based on your category widget size
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return NewCategoriesHomeWidget(
              title: categories[index].name,
              image: categories[index].image,
            );
          },
        ),
      ),
    );
  }
}
