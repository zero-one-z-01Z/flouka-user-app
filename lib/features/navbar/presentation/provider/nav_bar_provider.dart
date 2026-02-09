import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/auth/presentation/views/profile_view.dart';
import 'package:flouka/features/categories/presentation/view/categories_view.dart';
import 'package:flouka/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/bottom_nav_bar_entity.dart';
import '../views/nav_bar_view.dart';

class NavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> body = [
    const HomePage(),
    const CategoriesView(),
    const SizedBox.shrink(),
    const CartView(),
    const ProfileView(),
  ];

  final List<BottomNaBarEntity> bottomNavigationBarItemEntity = [
    BottomNaBarEntity(
      svgImage: AppImages.navbarHome,
      label: LanguageProvider.translate('navbar', 'home'),
    ),
    BottomNaBarEntity(
      svgImage: AppImages.navbarCategories,
      label: LanguageProvider.translate('navbar', 'categories'),
    ),
    BottomNaBarEntity(svgImage: "", label: ""),
    BottomNaBarEntity(
      svgImage: AppImages.navbarCart,
      label: LanguageProvider.translate('navbar', 'cart'),
    ),
    BottomNaBarEntity(
      svgImage: AppImages.navbarProfile,
      label: LanguageProvider.translate('navbar', 'profile'),
    ),
  ];

  void goToNavView() {
    currentIndex = 0;
    navPARU(const NavBarView());
  }

  void changeIndex(int index) {
    if (index == 2) {
      return;
    }
    currentIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) {
    return currentIndex == index;
  }
}
