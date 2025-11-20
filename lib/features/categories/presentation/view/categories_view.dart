import 'package:flouka/features/categories/presentation/widgets/categories_grid_view.dart';
import 'package:flouka/features/categories/presentation/widgets/searchbar_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 6.h),
              const SearchbarContainer(),
              SizedBox(height: 1.h),
              const CategoriesGridView(),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
