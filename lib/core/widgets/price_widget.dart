import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/app_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});
  final num price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r"$",
          style: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 18.sp,
          ),
        ),
        Text(
          price.toString(),
          style: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
