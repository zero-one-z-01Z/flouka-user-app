import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/helper_function/prefs.dart';
import '../../../core/helper_function/helper_function.dart';
import '../../categories/presentation/providers/categories_provider.dart';

class SplashProvider extends ChangeNotifier {
  void startApp() async {
    await Future.wait([
      delay(500),
      Provider.of<BannersProvider>(
        Constants.globalContext(),
        listen: false,
      ).getBanners(),
      Provider.of<CategoryProvider>(
        Constants.globalContext(),
        listen: false,
      ).getCategories(),
      Provider.of<CategoryProvider>(
        Constants.globalContext(),
        listen: false,
      ).getPopularCategories(),
    ]);

    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    String? isLoggedIn = sharedPreferences.getString('token');
    if (true) {
      navPARU(const HomePage());
    }
  }
}
