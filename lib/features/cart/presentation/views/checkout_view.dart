import 'package:flouka/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../address/presentation/widgets/my_address_widget.dart';
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
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate("global", "checkout"),
          style: TextStyleClass.normalStyle(),
        ),
      ),
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
                    const MyAddressWidget(),
                    SizedBox(height: 2.h),
                    CheckoutItemWidget(
                      cartEntity: cartProvider.data?[0] ?? CartEntity(),
                    ),
                    SizedBox(height: 1.3.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageProvider.translate("global", "Pay With"),
                            style: TextStyleClass.normalStyle().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 1.3.h),
                          const PaymentMethodsList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.3.h),
                    const PriceDetailesList(),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Stack(
                children: [
                  ButtonWidget(
                    onTap: () {},
                    color: const Color(0xffB4B4B4),
                    text: 'send_order',
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 4.w,
                    top: 1.2.h,
                    child: Image.asset(Images.arrowRight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
