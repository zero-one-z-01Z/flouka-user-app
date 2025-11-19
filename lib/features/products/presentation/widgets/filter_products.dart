import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterProductsWidget extends StatefulWidget {
  const FilterProductsWidget({super.key});

  @override
  State<FilterProductsWidget> createState() => _FilterProductsWidgetState();
}

class _FilterProductsWidgetState extends State<FilterProductsWidget> {
  int _selectedIndex = 0;

  final List<String> _filters = const [
    'For You',
    'New Gadget',
    'Best Silling',
    'Computer',
    'Mobile',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: SizedBox(
        height: 10.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filters.length,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            final bool isSelected = index == _selectedIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.black : const Color(0xffAEB1C1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
