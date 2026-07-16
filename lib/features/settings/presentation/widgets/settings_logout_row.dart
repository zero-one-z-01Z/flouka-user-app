import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SettingsLogoutRow extends StatelessWidget {
  final AuthProvider provider;

  const SettingsLogoutRow({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: provider.showLogoutDialog,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                color: Colors.red,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Text(
                LanguageProvider.translate('settings', 'logout'),
                style: TextStyleClass.normalStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
