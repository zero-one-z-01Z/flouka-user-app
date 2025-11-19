import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper_function/prefs.dart';
import '../../../core/helper_function/helper_function.dart';

class SplashProvider extends ChangeNotifier {
  void startApp() async {
    await Future.wait([delay(500)]);

    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    String? isLoggedIn = sharedPreferences.getString('token');
    if (true) {
      navPARU(HomePage());
    }
  }
}
