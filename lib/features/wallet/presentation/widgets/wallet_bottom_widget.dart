import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/button_widget.dart';
import '../provider/wallet_provider.dart';

class WalletBottomWidget extends StatelessWidget {
  const WalletBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WalletProvider walletProvider = Provider.of(context);

    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: ButtonWidget(
                borderRadius: 12,
                withShadow: false,
                onTap: () {
                  walletProvider.showChargeSheet();
                },
                text: "charge_wallet",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
