import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/checkout_provider.dart';
import '../providers/coupon_provider.dart';
import 'payment_price_widget.dart';

class PriceDetailesList extends StatelessWidget {
  const PriceDetailesList({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    final couponProvider = Provider.of<CouponProvider>(context);
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
            fontSize: 16.sp,
            title: LanguageProvider.translate("global", "price"),
            price: checkoutProvider.cartPrice.toStringAsFixed(2),
          ),
          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          PaymentPriceWidget(
            fontSize: 16.sp,
            title: LanguageProvider.translate("global", "Shiping"),
            price: checkoutProvider.delivery.toStringAsFixed(2),
          ),
          if (couponProvider.couponEntity != null) ...[
            Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
            PaymentPriceWidget(
              fontSize: 16.sp,
              title: LanguageProvider.translate("global", "discount"),
              price: couponProvider
                  .calcCoupon(checkoutProvider.subTotalTax)!
                  .toStringAsFixed(2),
            ),
          ],
          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          PaymentPriceWidget(
            fontSize: 16.sp,
            title: LanguageProvider.translate("global", "Taxes"),
            price: checkoutProvider.tax.toStringAsFixed(2),
          ),
          Divider(color: Colors.grey.shade400, endIndent: 32, indent: 32),
          PaymentPriceWidget(
            fontSize: 15.99.sp,
            title: LanguageProvider.translate("global", "total"),
            price: checkoutProvider.total.toStringAsFixed(2),
            isGreen: true,
          ),
        ],
      ),
    );
  }
}
