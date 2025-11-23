import 'package:flouka/core/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';

class CustomOrderPaymentWayWidget extends StatelessWidget {
  const CustomOrderPaymentWayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.primaryColor, width: 1.2),
      ),
      child: Row(
        spacing: 16,
        children: [
          Text(
            LanguageProvider.translate("global", "Payment details"),
            style: TextStyleClass.normalStyle().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          const SvgWidget(svg: Images.wallet),
          Text(LanguageProvider.translate("global", "Wallet App")),
        ],
      ),
    );
  }
}
