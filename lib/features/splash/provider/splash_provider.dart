import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/cart/presentation/providers/cart_provider.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_provider.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
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
      Provider.of<CartProvider>(Constants.globalContext(), listen: false).getData(),
      Provider.of<OrderProvider>(Constants.globalContext(), listen: false).getData(),
    ]);

    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    String? isLoggedIn = sharedPreferences.getString('token');
    if (isFirstTime) {
      Provider.of<NavBarProvider>(
        Constants.globalContext(),
        listen: false,
      ).goToNavView();
    // if (isFirstTime) {
    //   Provider.of<OnBoardingProvider>(Constants.globalContext(), listen: false,).goToOnBoardingView();

    // }else{
      // Provider.of<NavBarProvider>(Constants.globalContext(), listen: false,).currentIndex = 0;
      Provider.of<NavBarProvider>(Constants.globalContext(), listen: false,).goToNavView();
    }
  }
