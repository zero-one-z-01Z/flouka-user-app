import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';

class HeaderWalletWidget extends StatelessWidget {
  const HeaderWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    return Container(
      height: 18.h,
      margin: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadiusDirectional.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            LanguageProvider.translate('global', 'US'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
