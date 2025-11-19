import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/auth/presentation/views/sign_me_up_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widgets/auth_stack_images_widget.dart';

class LoginOrRegisterView extends StatelessWidget {
  const LoginOrRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthStackImagesWidget(),
          SizedBox(height: 5.h),
          Image.asset(Images.bigLogo),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              textAlign: TextAlign.center,
              LanguageProvider.translate("auth", "Whatever you love, we have it."),
              style: TextStyleClass.semiHeadStyle(),
            ),
          ),
          SizedBox(height: 8.h),
          ButtonWidget(
            onTap: () {
              navP(const SignMeUpView());
            },
            text: "Sign up",
            borderRadius: 16,
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageProvider.translate("auth", "Already have an account?"),
                style: TextStyleClass.normalStyle(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  LanguageProvider.translate("auth", "Login"),
                  style: TextStyleClass.normalStyle().copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
