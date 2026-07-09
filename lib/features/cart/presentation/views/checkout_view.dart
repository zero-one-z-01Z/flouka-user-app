import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../address/presentation/providers/address_provider.dart';
import '../../../address/presentation/widgets/my_address_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/checkout_provider.dart';
import '../widgets/checkout_item_widget.dart';
import '../widgets/coupons_widget.dart';
import '../widgets/payment_method_list.dart';
import '../widgets/price_details_widget.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final AddressProvider addressProvider = Provider.of<AddressProvider>(context);
    final OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(LanguageProvider.translate("global", "checkout"),),),
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
                    SizedBox(height: 2.h),

                    if(authProvider.userEntity?.addressEntity!=null)
                    MyAddressWidget(addressEntity: authProvider.userEntity!.addressEntity!,),
                    SizedBox(height: 2.h),
                    Text(
                      LanguageProvider.translate("global", "payment_method"),
                      style: TextStyleClass.normalStyle().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 1.3.h),
                    const PaymentMethodsList(),

                    if(cartProvider.data?.isNotEmpty ?? false)...[
                      SizedBox(height: 1.3.h),
                      Text(
                        LanguageProvider.translate("global", "my_orders"),
                        style: TextStyleClass.normalStyle().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 1.3.h),
                      CheckoutItemWidget(
                        cartEntity: cartProvider.data!,
                      ),

                    ],
                    SizedBox(height: 1.3.h),
                    const CouponsWidget(),
                    SizedBox(height: 1.3.h),
                    const PriceDetailesList(),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            ButtonWidget(onTap: (){
              checkoutProvider.makeOrder();

            }, text: "confirm",color: AppColor.secondaryColor,),
            // DraggableImageButton(
            //   onComplete: () {
            //     checkoutProvider.makeOrder();
            //   },
            // ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
