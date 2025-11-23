import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class SignMeUpView extends StatelessWidget {
  const SignMeUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Transform.scale(
            scale: 1.3,
            child: Image.asset(Images.bigLogo, width: 30.w),
          ),
          SizedBox(height: 10.h),
          Image.asset(Images.signup2, width: 60.w),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              textAlign: TextAlign.center,
              LanguageProvider.translate("auth", "And that’s the cherry on top!"),
              style: TextStyleClass.headStyle().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              LanguageProvider.translate("auth", "no_fees"),
              textAlign: TextAlign.center,
              style: TextStyleClass.normalStyle().copyWith(height: 1.5),
            ),
          ),
          SizedBox(height: 4.h),
          ButtonWidget(
            onTap: () {
              authProvider.goToLoginView();
            },
            text: "Sign up",
            borderRadius: 16,
          ),
          SizedBox(height: 2.h),
          Text(
            LanguageProvider.translate("auth", "Ask me again later"),
            style: TextStyleClass.normalStyle(color: const Color(0xffcbcbd4)),
          ),
        ],
      ),
    );
  }
}

  // Container(width: 20.w,height: 20.w,
  //                           decoration:BoxDecoration(shape: BoxShape.circle,
  //                               border: Border.all(color: AppColor.defaultColor,width: 2),
  //                               image: DecorationImage(image: serviceProvider.showUserImage(),fit: BoxFit.cover)
  //                           )
  //                       ),