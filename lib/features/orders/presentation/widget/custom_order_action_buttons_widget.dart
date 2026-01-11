import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../language/presentation/provider/language_provider.dart';
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
            borderRadius: 10,

            color: const Color(0xffdff7ff),
            onTap: () {},
            text: LanguageProvider.translate("buttons", "Seller"),
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
        Expanded(
          child: ButtonWidget(
            borderRadius: 10,

            color: const Color(0xffdff7ff),
            onTap: () {},
            text: LanguageProvider.translate("buttons", "Product"),
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
        Expanded(
          child: ButtonWidget(
            borderRadius: 10,

            color: const Color(0xffdff7ff),
            onTap: () {},
            text: LanguageProvider.translate("buttons", "Delivery"),
            textStyle: TextStyleClass.smallStyle(),
            height: 4.h,
          ),
        ),
      ],
    );
  }
}
