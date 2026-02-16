// ignore_for_file: unused_import

import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/cart/presentation/providers/cart_provider.dart';
import 'package:flouka/features/navbar/presentation/views/nav_bar_view.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import 'package:flouka/features/wallet/presentation/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/helper_function/prefs.dart';
import '../../../core/helper_function/helper_function.dart';
import '../../address/presentation/providers/address_provider.dart';
import '../../categories/presentation/providers/categories_provider.dart';
import '../../categories/presentation/providers/popular_categoey_provider.dart';
import '../../filters/presentation/providers/filter_product_provider.dart';
import '../../navbar/presentation/provider/nav_bar_provider.dart';
import '../../offers_section/presentation/providers/offer_section_provider.dart';
import '../../on_boarding/presentation/providers/on_boarding_provider.dart';
import '../../on_boarding/presentation/views/on_boarding_view.dart';
import '../../stores/presentation/providers/stores_provider.dart';

class SplashProvider extends ChangeNotifier {
  void startApp() async {
    await Future.wait([
      delay(500),
      // Provider.of<BannersProvider>(
      //   Constants.globalContext(),
      //   listen: false,
      // ).getBanners(),
      // Provider.of<CategoryProvider>(
      //   Constants.globalContext(),
      //   listen: false,
      // ).getCategories(),
      Provider.of<PopularCategoryProvider>(
        Constants.globalContext(),
        listen: false,
      ).getPopularCategories(),
      Provider.of<OrderProvider>(Constants.globalContext(), listen: false).getData(),
      // Provider.of<AddressProvider>(
      //   Constants.globalContext(),
      //   listen: false,
      // ).getAddress(),
      // Provider.of<WalletProvider>(
      //   Constants.globalContext(),
      //   listen: false,
      // ).walletOperations(),
      Provider.of<CartProvider>(Constants.globalContext(), listen: false).getData(),
      Provider.of<FilterProductProvider>(
        Constants.globalContext(),
        listen: false,
      ).getData(),
      Provider.of<StoresProvider>(
        Constants.globalContext(),
        listen: false,
      ).getData(),
      Provider.of<OfferSectionProvider>(
        Constants.globalContext(),
        listen: false,
      ).getData(),
    ]);

    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    final context = Constants.globalContext();
    var auth = Provider.of<AuthProvider>(context, listen: false);
    String? isLoggedIn = sharedPreferences.getString('token');
    if (isFirstTime) {
      navPARU(const OnBoardingView());
    } else {
      if (isLoggedIn != null) {
        auth.getProfile();
      } else {
        auth.goToLoginView();
      }
    }
    // navPARU(const NavBarView());
  }
}
