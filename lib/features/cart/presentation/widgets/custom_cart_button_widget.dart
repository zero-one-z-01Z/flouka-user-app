import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/checkout_provider.dart';

class CustomCartButtonWidget extends StatelessWidget {
  const CustomCartButtonWidget({super.key, required this.cartProvider});

  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                LanguageProvider.translate("global", "total"),
                style: TextStyleClass.smallStyle(color: Colors.grey),
              ),
              PriceWidget(price: convertDataToDouble(cartProvider.caluclateTotal().toStringAsFixed(2))),
            ],
          ),
          ButtonWidget(
            width: 40.w,
            color: AppColor.primaryColor,
            onTap: () {
              if(authProvider.userEntity?.addressEntity!=null){
                checkoutProvider.goToPage();
              }else{
                showToast(LanguageProvider.translate("error","add_address"),isSnack: true,action: {"text":LanguageProvider.translate('buttons', 'add'),'onTap':(){
                  Provider.of<AddressProvider>(context,listen: false).goToAddressPage();
                }});
              }

            },
            text: "checkout",
          ),
        ],
      ),
    );
  }
}
