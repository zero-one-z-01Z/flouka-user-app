import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../../core/config/app_color.dart';
import '../providers/otp_provider.dart';

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpProvider otpProvider = Provider.of(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        cursorColor: Colors.black38,
        enablePinAutofill: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        separatorBuilder: (context, position) => Column(
          children: [
            Container(width: 10, height: 80, color: Colors.grey.shade200),
          ],
        ),
        pinTheme: PinTheme(
          borderRadius: BorderRadius.circular(12),
          selectedColor: AppColor.primaryColor,
          selectedFillColor: Colors.white,
          activeColor: AppColor.primaryColor,
          inactiveColor: Colors.grey,
          shape: PinCodeFieldShape.underline,
          fieldHeight: 55,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          errorBorderColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        controller: otpProvider.otpController,
        onCompleted: (v) {
          // otpProvider.checkCode();
        },
      ),
    );
  }
}
