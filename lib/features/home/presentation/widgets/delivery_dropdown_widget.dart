import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../address/presentation/providers/address_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';

class DeliveryDropdownWidget extends StatelessWidget {
  const DeliveryDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    final AddressProvider addressProvider = Provider.of<AddressProvider>(context);

    return InkWell(
      onTap: () {
        addressProvider.goToAddressPage();
      },
      child: Row(
        children: [
          SvgWidget(svg: AppImages.location, width: 6.w),
          SizedBox(width: 2.w),
          if(authProvider.userEntity?.addressEntity != null )
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LanguageProvider.translate("home", "deliver_to"),
                  style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
                ),
                Text(
                  authProvider.userEntity?.addressEntity?.addressName??"",
                  style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
          if(authProvider.userEntity?.addressEntity == null )
            Expanded(
              child: Text(
                LanguageProvider.translate("home", "select_location"),
                style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
              ),
            ),
          SizedBox(width: 2.w),
          Icon(Icons.arrow_drop_down, color: AppColor.primaryColor),
        ],
      ),
    );
  }
}
