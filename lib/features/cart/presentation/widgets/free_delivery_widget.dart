import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/settings/domain/entities/settings_entity.dart';
import 'package:flouka/features/settings/presentation/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/checkout_provider.dart';

class FreeDeliveryWidget extends StatelessWidget {
  const FreeDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);


    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.5.h),
      child: Row(
        children: [
          Image.asset(AppImages.offer,width: 7.w,),
          SizedBox(width: 5.w,),
          Expanded(
            child: Text(checkoutProvider.freeDelvieryText()!),
          ),
        ],
      ),
    );
  }
}
