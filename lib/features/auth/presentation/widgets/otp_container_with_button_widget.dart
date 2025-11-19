import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF7F6F6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          RowTextWidget(
            normalText: LanguageProvider.translate(
              "auth",
              "Enter the verification code sent to",
            ),
            highlightedTextWithonTap: otpProvider.otpNumber,
          ),
          const CustomOTPField(),
          Selector<OtpProvider, int>(
            builder: (context, value, child) => InkWell(
              onTap: () {
                // otpProvider.sendOtp(isResend: true);
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
          ButtonWidget(
            text: "Active",
            textStyle: TextStyleClass.headStyle().copyWith(
              color: Colors.white,
              fontSize: 15.sp,
            ),
            onTap: () {
              completeInfoProvider.goToCompleteInfoView();

              // otpProvider.checkCode();
            },
          ),
        ],
      ),
    );
  }
}
