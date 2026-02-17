import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import '../../../cart/presentation/widgets/payment_price_widget.dart';
import '../provider/order_details_provider.dart';

class OrderPriceDetailsWidget extends StatelessWidget {
  const OrderPriceDetailsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final OrderDetailsProvider orderDetailsProvider =
        Provider.of<OrderDetailsProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 4,
        children: [
          PaymentPriceWidget(
            title: LanguageProvider.translate("global", "price"),
            price: orderDetailsProvider.data!.price.toString(),
          ),

          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          PaymentPriceWidget(
            title: LanguageProvider.translate("global", "delivery"),
            price: orderDetailsProvider.data!.price.toString(),
          ),
          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          PaymentPriceWidget(
            title: LanguageProvider.translate("global", "tax"),
            price: orderDetailsProvider.data!.price.toString(),
          ),
          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          if (orderDetailsProvider.data!.price != 0) ...[
            PaymentPriceWidget(
              title: LanguageProvider.translate("global", "discount"),
              price: orderDetailsProvider.data!.price.toString(),
            ),
            Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          ],
          PaymentPriceWidget(
            title: LanguageProvider.translate("global", "total"),
            price: orderDetailsProvider.data!.price.toString(),
            isGreen: true,
          ),
        ],
      ),
    );
  }
}
