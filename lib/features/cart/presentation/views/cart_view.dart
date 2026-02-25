import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_list_view_seperated_widget.dart';
import '../widgets/custom_cart_button_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    // final checkoutProvider = Provider.of<CheckoutProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffeffbff),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  cartProvider.refresh();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.5.h),
                      if (cartProvider.data != null &&
                          cartProvider.data!.isNotEmpty) ...[
                        Text(
                          LanguageProvider.translate("global", "coupon"),
                          style: TextStyleClass.normalStyle(),
                        ),
                        SizedBox(height: 1.3.h),
                      ],
                      SizedBox(height: 3.h),
                      const CartListViewSeperatedWidget(),
                    ],
                  ),
                ),
              ),
            ),
            if (cartProvider.data != null && cartProvider.data!.isNotEmpty)
              CustomCartButtonWidget(cartProvider: cartProvider),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
