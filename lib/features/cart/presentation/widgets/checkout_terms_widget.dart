import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/checkbox_widget.dart';
import 'package:flouka/core/widgets/validation_widget.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/cart/presentation/providers/checkout_provider.dart';
import 'package:flouka/features/settings/domain/entities/settings_entity.dart';
import 'package:flouka/features/settings/presentation/provider/settings_provider.dart';
import 'package:flouka/features/settings/presentation/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../features/language/presentation/provider/language_provider.dart';

class CheckoutTermsWidget extends StatelessWidget {
  const CheckoutTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<CheckoutProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CheckBoxWidget(
                check: checkout.termsAccepted,
                onChange: checkout.toggleTermsAccepted,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  LanguageProvider.translate("global", "order_agree_terms"),
                  style: TextStyleClass.normalStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
