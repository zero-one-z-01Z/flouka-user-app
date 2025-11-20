
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/cart_provider.dart';

class CustomCartButtonWidget extends StatelessWidget {
  const CustomCartButtonWidget({super.key, required this.cartProvider});

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                LanguageProvider.translate("global", "total"),
                style: TextStyleClass.smallStyle(color: Colors.grey),
              ),
              PriceWidget(price: cartProvider.caluclateTotal()),
            ],
          ),
          ButtonWidget(
            width: 40.w,
            color: AppColor.primaryColor,
            onTap: () {},
            text: "CHECOUT",
          ),
        ],
      ),
    );
  }
}
