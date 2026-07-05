import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/complete_info_provider.dart';
import '../providers/otp_provider.dart';
import 'custom_otp_field.dart';
import 'row_text_widget.dart';

class OtpContainerWithButton extends StatelessWidget {
  const OtpContainerWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context);
    final completeInfoProvider = Provider.of<CompleteInfoProvider>(
      context,
      listen: false,
    );
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Center(
            child: Text(LanguageProvider.translate("auth", "otp"),style: TextStyleClass.headStyle().copyWith(
              fontWeight: FontWeight.bold,height: 1
            ),),
          ),
          RowTextWidget(
            normalText: LanguageProvider.translate(
              "auth",
              "Enter the verification code sent to",
            ),
            highlightedTextWithonTap:
                "(${authProvider.loginTextFieldList[0].controller.text})",
          ),
          SizedBox(height: 1.h),
          Image.asset(AppImages.otpBack, ),
          SizedBox(height: 0.5.h),

          const CustomOTPField(),
          Center(
            child: Selector<OtpProvider, int>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  authProvider.sendOTP(isResend: true);
                },
                child: Text(
                  "${LanguageProvider.translate("auth", "resend_otp_after")} ${otpProvider.sendCode(value)}",
                  style: TextStyleClass.headStyle().copyWith(
                    fontSize: 15.sp,
                    color: otpProvider.counter > 0
                        ? const Color(0xff525252)
                        : AppColor.primaryColor,
                  ),
                ),
              ),
              selector: (p0, p1) => otpProvider.counter,
            ),
          ),

        ],
      ),
    );
  }
}
