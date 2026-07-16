import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/wallet_provider.dart';

class HeaderWalletWidget extends StatelessWidget {
  const HeaderWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    WalletProvider walletProvider = Provider.of(context);
    return Container(
      // height: 18.h,
      margin: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  LanguageProvider.translate("global", "your_credit"),
                  style: TextStyleClass.normalStyle().copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      " ${authProvider.userEntity?.wallet ?? 0} ",
                      style: TextStyleClass.normalStyle().copyWith(
                        color: Colors.white,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      LanguageProvider.translate('global', 'currency'),
                      style: TextStyleClass.normalStyle().copyWith(
                        color: Colors.white,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 7.w,),
          InkWell(
            onTap: (){
              walletProvider.showChargeSheet();
            },
            child: CircleAvatar(
              radius: 6.w,
              backgroundColor: Colors.white,
              child: Icon(Icons.add,color: AppColor.primaryColor,size: 30,),
            ),
          ),
        ],
      ),
    );
  }
}
