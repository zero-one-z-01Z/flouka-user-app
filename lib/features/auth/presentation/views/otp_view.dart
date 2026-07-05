import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/auth/presentation/providers/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/button_widget.dart';
import '../widgets/otp_container_with_button_widget.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false ,
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Column(children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 7.h),
                        // Text(
                        //   LanguageProvider.translate("auth", "sign Up"),
                        //   style: TextStyleClass.smallStyle().copyWith(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 15.sp,
                        //   ),
                        // ),
                        // SizedBox(height: 8.h),
                        Image.asset(AppImages.logo, width: 20.w),
                        SizedBox(height: 3.h),
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
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h),
                  child: ButtonWidget(
                    text: "send",
                    textStyle: TextStyleClass.headStyle().copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                    onTap: () {
                      // completeInfoProvider.goToCompleteInfoView();
                      OtpProvider otpProvider = Provider.of(context, listen: false);
                      otpProvider.checkCode();
                    },
                  ),
                ),
              ],),
              Positioned(
                  top: 0,left: 0,right: 0,
                  child: Image.asset(AppImages.topAuth)),
            ],
          ),
        ),
      ),
    );
  }
}
