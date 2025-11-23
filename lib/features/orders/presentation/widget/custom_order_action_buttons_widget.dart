
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';

class CustomOrderActionButtonsWidget extends StatelessWidget {
  const CustomOrderActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.w,
      children: [
        Expanded(
          child: ButtonWidget(
            color: const Color(0xffdff7ff),
            onTap: () {},
            text: "Seller",
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
        Expanded(
          child: ButtonWidget(
            color: const Color(0xffdff7ff),
            onTap: () {},
            text: "Product",
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
        Expanded(
          child: ButtonWidget(
            color: const Color(0xffdff7ff),
            onTap: () {},
            text: "Delivery",
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
      ],
    );
  }
}
