import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/checkout_provider.dart';
import '../providers/coupon_provider.dart';
import 'payment_price_widget.dart';

class PriceDetailesList extends StatelessWidget {
  const PriceDetailesList({super.key, this.isBold = false});
  final bool? isBold;
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
            price: checkoutProvider.subtotal().toStringAsFixed(2),
            color: Colors.grey,
          ),
          // PaymentPriceWidget(
          //   fontSize: 16.sp,
          //   title: LanguageProvider.translate("global", "shipping"),
          //   price: couponProvider.calcDiscount()?.toStringAsFixed(2)??"",
          // ),

          if (couponProvider.couponEntity != null && couponProvider.couponEntity!.isNotEmpty) ...[
            Container(color: Colors.grey.shade300, height: 0.1.h,width: 100.w,),
            PaymentPriceWidget(
              fontSize: 16.sp,
              title: LanguageProvider.translate("global", "discount"),
              price: couponProvider.calcDiscount()?.toStringAsFixed(2)??"",
              color: Colors.grey,
            ),
          ],
          Container(color: Colors.grey.shade300, height: 0.1.h,width: 100.w,),
          PaymentPriceWidget(
            fontSize: 16.sp,
            title: LanguageProvider.translate("global", "tax"),
            price: checkoutProvider.tax().toStringAsFixed(2),
            color: Colors.grey,
          ),
          Container(color: Colors.grey.shade300, height: 0.1.h,width: 100.w,),
          PaymentPriceWidget(
            fontSize: 16.sp,
            title: LanguageProvider.translate("global", "delivery"),
            price: checkoutProvider.deliveryPrice().toStringAsFixed(2),
            color: Colors.grey,
          ),
          Container(color: Colors.grey.shade300, height: 0.1.h,width: 100.w,),
          PaymentPriceWidget(
            fontSize: 15.99.sp,
            title: LanguageProvider.translate("global", "total"),
            price: checkoutProvider.total().toStringAsFixed(2),
            color: Colors.black,
            isGreen: true,
            isBold: isBold,
          ),
        ],
      ),
    );
  }
}
