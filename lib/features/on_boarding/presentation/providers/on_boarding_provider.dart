// ignore_for_file: unused_import

import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/helper_function/prefs.dart';
import 'package:flouka/features/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:flouka/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/views/login_or_register_view.dart';

class OnBoardingProvider extends ChangeNotifier {
  void goToOnBoardingView() {
    navPARU(const OnBoardingView());
  }

  void onNextButtonPressed() {
    if (pageController.hasClients) {
      if (pageController.page == onBoardingList.length - 1) {
        skipButtonPressed();
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void skipButtonPressed() {
    // navigation
    navPARU(const LoginOrRegisterView());
    sharedPreferences.setBool("onBoarding", true);
  }

  final PageController pageController = PageController();

  final List<OnBoardingEntity> onBoardingList = [
    const OnBoardingEntity(
      title: "Welcome!",
      description: "on_boarding_1",
      image: Images.onboardingImage1,
      backGroundImage: Images.yellowCircle,
    ),
    const OnBoardingEntity(
      title: "Irrelevant results again?",
      description: "on_boarding_2",
      image: Images.onboardingImage2,
      backGroundImage: Images.greenCircle,
    ),
    const OnBoardingEntity(
      title: "Your interests working with you.",
      description: "on_boarding_3",
      image: Images.onboardingImage3,
      backGroundImage: Images.pinkCircle,
    ),
  ];
}
