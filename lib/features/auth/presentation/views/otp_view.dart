import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/constants/app_images.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widgets/otp_container_with_button_widget.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context);
    return Scaffold(
      body: Padding(
        padding: globalPadding,
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  LanguageProvider.translate("auth", "sign Up"),
                  style: TextStyleClass.smallStyle().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Image.asset(Images.logo2, width: 40.w),
                SizedBox(height: 8.h),
                const OtpContainerWithButton(),
                // SizedBox(height: 4.h),
                // Align(
                //   alignment: AlignmentDirectional.centerStart,
                //   child: CustomTextWithUnderLineText(
                //     customText: "Already have an account?",
                //     underLineText: "Login",
                //     onTap: () {
                //       authProvider.goToLoginView();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
