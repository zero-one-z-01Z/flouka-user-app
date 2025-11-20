import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/checkout_provider.dart';
import 'payment_method_widget.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: checkoutProvider.paymentMethods.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PaymentMthodItemWidget(
        paymentMethodEntity: checkoutProvider.paymentMethods[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
