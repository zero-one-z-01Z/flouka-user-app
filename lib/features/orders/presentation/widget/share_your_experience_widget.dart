import 'package:flouka/features/orders/presentation/widget/custom_order_action_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class ShareYourExperienceWidget extends StatelessWidget {
  const ShareYourExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate("global", "Share Your Experience"),
          style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp),
        ),
        SizedBox(height: 1.h),
        const CustomOrderActionButtonsWidget(),
      ],
    );
  }
}
