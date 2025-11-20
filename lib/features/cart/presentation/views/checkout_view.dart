import 'package:flouka/features/address/presentation/widgets/delivery_address_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/animation/slide_transition_widget.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entity/cart_entity.dart';
import '../providers/cart_provider.dart';
import '../providers/checkout_provider.dart';
import '../widgets/checkout_item_widget.dart';
import '../widgets/payment_method_list.dart';
import '../widgets/price_details_widget.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffeffbff),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageProvider.translate("global", "address"),
                      style: TextStyleClass.normalStyle(),
                    ),
                    SizedBox(height: 1.3.h),
                    const DeliveryAddressListWidget(),
                    SizedBox(height: 1.3.h),
                    Text(
                      "${LanguageProvider.translate("global", "the_order")} "
                      " 1 "
                      "${LanguageProvider.translate("global", "from")}"
                      " ${cartProvider.data?.length ?? 0} ",
                      style: TextStyleClass.normalStyle(),
                    ),
                    CheckoutItemWidget(
                      cartEntity: cartProvider.data?[0] ?? CartEntity(),
                    ),
                    SizedBox(height: 1.3.h),
                    Text(
                      LanguageProvider.translate("global", "payment_methods"),
                      style: TextStyleClass.normalStyle(),
                    ),
                    SizedBox(height: 1.3.h),
                    const PaymentMethodsList(),
                    SizedBox(height: 1.3.h),
                    const PriceDetailesList(),
                    SizedBox(height: 1.3.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: SlideTransitionWidget(
                child: ButtonWidget(
                  onTap: () {
                    checkoutProvider.makeOrder();
                  },
                  text: "pay",
                  color: const Color(0xff26c77c),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
