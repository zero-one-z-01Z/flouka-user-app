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
    return Container(width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${LanguageProvider.translate("global", "price")} : ${convertDataToDouble(cartProvider.caluclateTotal().toStringAsFixed(2))} \$",
            style: TextStyleClass.smallStyle(color: const Color(0xff444444)),
          ),
          SizedBox(height: 1.h),
          ButtonWidget(
            width: 100.w,height: 6.h,
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
            text: "pay",
          ),

        ],
      ),
    );
  }
}
