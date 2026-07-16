import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';

import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/settings_provider.dart';
import '../widgets/settings_action_buttons.dart';
import '../widgets/settings_section_container.dart';
import '../widgets/settings_section_title.dart';
import '../widgets/settings_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<AuthProvider>();
    final user = profileProvider.userEntity;
    SettingsProvider settingsProvider = Provider.of(context);
    final image = user?.image;

    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 4.h),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius:  const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        LanguageProvider.translate('settings', 'title'),
                        style: TextStyleClass.normalStyle().copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(width: 48.w),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white.withValues(
                      alpha: 0.2,
                    ),
                    backgroundImage: image==null?const AssetImage(AppImages.logo):CachedNetworkImageProvider(image),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    user?.name ?? LanguageProvider.translate('settings', 'hi_guest'),
                    style: TextStyleClass.normalStyle().copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if(user?.phone!=null)...[
                    SizedBox(height: 4.h),
                    Text(
                      user?.phone ?? '',
                      style: TextStyleClass.normalStyle().copyWith(
                        fontSize: 14.sp,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (settingsProvider.accountSettings.isNotEmpty) ...[
                    SettingsSectionTitle(
                      title: LanguageProvider.translate("settings", "account_settings"),
                    ),
                    SettingsSectionContainer(
                      children: List.generate(
                        settingsProvider.accountSettings.length,
                            (index) => SettingsWidget(
                          data: settingsProvider.accountSettings[index],
                          last: index == settingsProvider.accountSettings.length - 1,
                        ),
                      ),
                    ),
                  ],

                  // General Settings Section
                  SettingsSectionTitle(
                    title: LanguageProvider.translate("settings", "general_settings"),
                  ),
                  SettingsSectionContainer(
                    children: List.generate(
                      settingsProvider.generalSettings.length,
                          (index) {
                        return SettingsWidget(
                          data: settingsProvider.generalSettings[index],
                          last: index == settingsProvider.generalSettings.length - 1,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 4.h),
                  SettingsActionButtons(authProvider: profileProvider),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
