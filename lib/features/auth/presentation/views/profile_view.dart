import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/auth/presentation/widgets/profile_header_widget.dart';
import 'package:flouka/features/auth/presentation/widgets/profile_pages_section.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/settings/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import '../../../settings/presentation/provider/settings_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffEFFBFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 9.h),
              const ProfileHeaderWidget(),
              const ProfilePagesSection(),
              SizedBox(height: 1.h),
              Text(
                LanguageProvider.translate('global', 'settings'),
                style: TextStyleClass.normalStyle().copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),

              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Wrap(
                  children: List.generate(
                    settingsProvider.settingsList.length,
                    (index) => SettingsWidget(
                      settingsEntity: settingsProvider.settingsList[index],
                      isLast: index == settingsProvider.settingsList.length - 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
