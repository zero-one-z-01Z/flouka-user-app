

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'frequently_item_widget.dart';

class FrequentlyListWidget extends StatelessWidget {
  const FrequentlyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 2.w,
        children: List.generate(15, (index) => const FrequentlyItemWidget()),
      ),
    );
  }
}
