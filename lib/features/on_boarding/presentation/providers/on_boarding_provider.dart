// ignore_for_file: unused_import

import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/helper_function/prefs.dart';
import 'package:flouka/features/auth/presentation/views/login_view.dart';
import 'package:flouka/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:flouka/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../navbar/presentation/provider/nav_bar_provider.dart';

class OnBoardingProvider extends ChangeNotifier {
  void goToOnBoardingView() {
    navPARU(const OnBoardingView());
  }
  int index = 0;

  void onNextButtonPressed([int? index]) {
    if(index!=null){
      this.index = index;
      notifyListeners();
      return;
    }
    if (this.index == onBoardingList.length - 1) {
      skipButtonPressed();
    } else {
      this.index++;
      notifyListeners();
    }
  }

  void skipButtonPressed() {
    // navigation
    sharedPreferences.setBool("onBoarding", true);
    Constants.globalContext().read<NavBarProvider>().goToNavView(fromSplash: true);
  }
  OnBoardingEntity get selected => onBoardingList[index];
  final List<OnBoardingEntity> onBoardingList = [
    OnBoardingEntity(
      title1: "1_title1",
      title2: '1_title2',
      description: "1_description",
      image: AppImages.onboardingImage1,
      color: Color(0xffD7FC70),
      btnColor: Color(0xff35035C),
      stepColor: Color(0xff35035C),
      textColor: Color(0xffAD46FF),
      btnTextColor: Color(0xffD7FC70),
      descColor: Color(0xff35035C).withAlpha(170),
    ),
    OnBoardingEntity(
      title1: "2_title1",
      title2: '2_title2',
      description: "2_description",
      image: AppImages.onboardingImage2,
      color: Color(0xffAD46FF),
      btnColor: Color(0xff35035C),
      stepColor: Color(0xffD7FC70),
      textColor: Color(0xff35035C),
      btnTextColor: Color(0xffD7FC70),
      descColor: Colors.white.withAlpha(170),
    ),
    OnBoardingEntity(
      title1: "3_title1",
      title2: '3_title2',
      description: "3_description",
      image: AppImages.onboardingImage3,
      color: Color(0xff35035C),
      btnColor: Color(0xffD7FC70),
      stepColor: Color(0xffD7FC70),
      textColor: Color(0xffD7FC70),
      btnTextColor: Color(0xff35035C),
      descColor: Colors.white.withAlpha(150),
    ),
  ];
}
