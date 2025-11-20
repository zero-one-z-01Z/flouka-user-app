
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/cart_provider.dart';

class CheckoutCountWidget extends StatelessWidget {
  const CheckoutCountWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Row(
      children: [
        Text(
          "${LanguageProvider.translate("global", "Shipment")} ",
          style: TextStyleClass.normalStyle(),
        ),
        Text(
          "1 "
          "${LanguageProvider.translate("global", "of")}"
          " ${cartProvider.data?.length ?? 0} "
          "${LanguageProvider.translate("global", "items")}",
          style: TextStyleClass.normalStyle(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
