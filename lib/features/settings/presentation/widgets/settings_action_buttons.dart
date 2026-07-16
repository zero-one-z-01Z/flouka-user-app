import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SettingsActionButtons extends StatelessWidget {
  const SettingsActionButtons({
    super.key,
    required this.authProvider,
  });

  final AuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLogoutButton(context),
        SizedBox(height: 2.h),
        if (AuthProvider.isLogin())
        _buildDeleteAccountButton(context),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if(AuthProvider.isLogin()){
          authProvider.showLogoutDialog();
        }else{
          authProvider.successLogout();
        }
      },
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColor.primaryColor, size: 20.sp),
            SizedBox(width: 3.w),
            Text(
              AuthProvider.isLogin()?LanguageProvider.translate("settings", "logout"):LanguageProvider.translate("auth", "login"),
              style: TextStyleClass.normalStyle().copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton(BuildContext context) {
    return InkWell(
      onTap: () => authProvider.confirmDeleteAccount(),
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete_outline, color: Colors.white, size: 20.sp),
            SizedBox(width: 3.w),
            Text(
              LanguageProvider.translate("settings", "delete_account"),
              style: TextStyleClass.normalStyle().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
