import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/payment_method_entity.dart';
import '../providers/checkout_provider.dart';

class PaymentMthodItemWidget extends StatelessWidget {
  const PaymentMthodItemWidget({super.key, required this.paymentMethodEntity});
  final PaymentMethodEntity paymentMethodEntity;
  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    return InkWell(
      onTap: () {
        checkoutProvider.selectPaymentMethod(paymentMethodEntity);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xffeffbff),
          borderRadius: BorderRadius.circular(16),
          border: checkoutProvider.isPaymentMethodSelected(paymentMethodEntity)
              ? Border.all(color: AppColor.primaryColor, width: 1.2)
              : null,
        ),
        child: Row(
          spacing: 16,
          children: [
            SvgWidget(svg: paymentMethodEntity.image),
            Text(
              LanguageProvider.translate(
                "global",
                paymentMethodEntity.paymentMethod,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
