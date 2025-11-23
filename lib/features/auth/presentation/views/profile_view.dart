import 'package:flouka/features/auth/presentation/widgets/profile_header_widget.dart';
import 'package:flouka/features/auth/presentation/widgets/profile_pages_section.dart';
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
            children: [
              SizedBox(height: 9.h),
              const ProfileHeaderWidget(),
              const ProfilePagesSection(),
              Wrap(
                children: List.generate(
                  settingsProvider.settingsList.length,
                  (index) => SettingsWidget(
                    settingsEntity: settingsProvider.settingsList[index],
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
