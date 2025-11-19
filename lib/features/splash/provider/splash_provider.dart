import 'package:flouka/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/helper_function/prefs.dart';
import '../../../core/helper_function/helper_function.dart';
import '../../on_boarding/presentation/providers/on_boarding_provider.dart';

class SplashProvider extends ChangeNotifier {
  void startApp() async {
    await Future.wait([delay(500)]);

    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    String? isLoggedIn = sharedPreferences.getString('token');
    final onBoardingProvider = Provider.of<OnBoardingProvider>(
      Constants.globalContext(),
      listen: false,
    );
    if (true) {
      onBoardingProvider.goToOnBoardingView();
    }
  }
}
