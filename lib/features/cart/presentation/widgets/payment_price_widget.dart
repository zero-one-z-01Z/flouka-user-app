import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/price_widget.dart';

class PaymentPriceWidget extends StatelessWidget {
  const PaymentPriceWidget({
    super.key,
    required this.title,
    required this.price,
    this.isGreen = false,
  });
  final String title;
  final String price;
  final bool isGreen;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyleClass.normalStyle().copyWith(
            fontSize: 15.sp,
            fontWeight: isGreen ? FontWeight.w900 : FontWeight.normal,
            color: isGreen ? Colors.green : Colors.black,
          ),
        ),
        const Spacer(),
        PriceWidget(price: convertDataToNum(price) ?? 5555),
        // Text(
        //   "$price",
        //   style: AppStyles.style15Normal.copyWith(
        //     fontSize: 15.sp,
        //     fontWeight: isGreen ? FontWeight.w900 : FontWeight.normal,
        //     color: isGreen ? Colors.green : Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
