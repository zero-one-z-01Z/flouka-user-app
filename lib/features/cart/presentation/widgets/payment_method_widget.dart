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
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: checkoutProvider.isPaymentMethodSelected(paymentMethodEntity)
              ? Border.all(color: Colors.black, width: 1)
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
