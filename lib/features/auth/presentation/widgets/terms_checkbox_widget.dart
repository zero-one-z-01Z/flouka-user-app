import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/checkbox_widget.dart';
import 'package:flouka/core/widgets/validation_widget.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/settings/domain/entities/settings_entity.dart';
import 'package:flouka/features/settings/presentation/provider/settings_provider.dart';
import 'package:flouka/features/settings/presentation/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../features/language/presentation/provider/language_provider.dart';

class TermsCheckboxWidget extends StatelessWidget {
  const TermsCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CheckBoxWidget(
                check: authProvider.termsAccepted,
                onChange: authProvider.toggleTermsAccepted,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: InkWell(
                  onTap: (){
                    SettingsEntity settings = context.read<SettingsProvider>().settingsEntity!;
                    navP(WebViewPage(title: 'privacy_policy', link: settings.privacyLink));
                  },
                  child: Text(
                    LanguageProvider.translate("auth", "agree_terms"),
                    style: TextStyleClass.normalStyle(),
                  ),
                ),
              ),
            ],
          ),
          ValidationWidget(conditions: [
            {'value':!authProvider.termsAccepted,'text':LanguageProvider.translate('validation', 'terms')}
          ]),
        ],
      ),
    );
  }
}
