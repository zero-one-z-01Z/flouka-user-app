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

      child: Center(
        child: MaterialPinField(
          keyboardType: TextInputType.number,
          length: 4,
          pinController: otpProvider.otpController,
          obscureText: false,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (context, position) => Column(
            children: [Container(width: 25, height: 80, color: Colors.white)],
          ),
          theme: MaterialPinTheme(
            shape: MaterialPinShape.outlined,
            focusedFillColor: Colors.white,
            completeBorderColor: Colors.grey.shade200,
            borderColor: Colors.grey.shade200,
            focusedBorderColor: AppColor.primaryColor,
            cursorColor: AppColor.primaryColor,
            cellSize: const Size(65, 64),
            borderRadius: BorderRadius.circular(12),
          ),
          onCompleted: (v) {
            // otpProvider.checkCode();
          },
        ),
      ),
    );
  }
}
