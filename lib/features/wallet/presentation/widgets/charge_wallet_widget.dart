import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/wallet_provider.dart';

class ChargeWalletWidget extends StatelessWidget {
  const ChargeWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WalletProvider walletProvider = Provider.of(context);
    return Material(
      borderRadius: BorderRadius.circular(36),
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(
          4.w,
        ).add(EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 35.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 1.h),

              Text(
                LanguageProvider.translate("wallet", "charge_wallet"),
                style: TextStyleClass.normalStyle(  ),
              ),
              SizedBox(height: 2.h),
              Container(
                width: 100.w,
                height: 0.2.h,
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
              SizedBox(height: 2.h),

              Row(
                children: [
                  Text(
                    LanguageProvider.translate("wallet", "enter_value"),
                    style: TextStyleClass.normalStyle(),
                  ),
                ],
              ),
              SizedBox(height: 1.h),

              TextFieldWidget(
                color: const Color(0xffEFF2F2),
                borderColor: Colors.transparent,
                controller: walletProvider.walletChargeController,
                contentPadding: EdgeInsets.all(2.w),
                onChange: (val) {
                  if (val.isNotEmpty) {
                    if (num.tryParse(val) == null) {
                      walletProvider.walletChargeController.clear();
                      showToast(
                        LanguageProvider.translate('validation', 'number_error'),
                      );
                    }
                  }
                },
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LanguageProvider.translate("global", "dinar"),
                      style: TextStyleClass.normalStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (walletProvider.walletChargeController.text.isNotEmpty) {
                    navPop();
                    walletProvider.chargeWallet(
                      value: walletProvider.walletChargeController.text,
                    );
                  }
                },
                child: Container(
                  width: 60.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(58.8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Center(
                        child: Text(
                          LanguageProvider.translate("buttons", "pay"),
                          style: TextStyleClass.normalStyle(),
                        ),
                      ),
                      Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            LanguageProvider.translate("global", "dinar"),
                            style: TextStyleClass.normalStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
