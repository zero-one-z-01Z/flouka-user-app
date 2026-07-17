import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../features/language/presentation/provider/language_provider.dart';
import '../config/app_styles.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price, this.fontSize, this.color});
  final num price;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [


        Text(
          price.toString(),
          style: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.w900,
            fontSize: fontSize ?? 14.sp,
            color:color?? (fontSize == 15.99.sp ? Colors.green : Colors.black),
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          LanguageProvider.translate('global', 'currency'),
          style: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.w900,
            fontSize: fontSize ?? 16.sp,
            color: color ?? (fontSize == 15.99.sp ? Colors.green : Colors.black),
          ),
        ),
      ],
    );
  }
}
