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
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "cart"),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  cartProvider.refresh();
                },
                child:const SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartListViewSeperatedWidget(),
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
