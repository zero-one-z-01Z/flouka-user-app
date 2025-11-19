import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/list_text_field_widget.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/auth/presentation/widgets/custom_text_with_under_line_login_text.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/button_widget.dart';
import '../widgets/login_social_media_list_widget.dart';
import '../widgets/or_divider_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Form(
          key: authProvider.registerFormKey,
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
              ListTextFieldWidget(inputs: authProvider.registerTextFieldList),
              SizedBox(height: 2.h),
              ButtonWidget(onTap: () {}, text: "Get started"),
              SizedBox(height: 2.h),
              const OrDividerWidget(),
              SizedBox(height: 3.h),
              const LoginSocialMediaListWidget(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomTextWithUnderLineText(
                  customText: "Already have an account?",
                  underLineText: "Login",
                  onTap: () {
                    authProvider.goToLoginView();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
