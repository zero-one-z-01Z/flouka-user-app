import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/bottom_nav_bar_entity.dart';
import '../views/nav_bar_view.dart';

class NavBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> body = const [
    HomePage(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  final List<BottomNaBarEntity> bottomNavigationBarItemEntity = [
    BottomNaBarEntity(
      svgImage: Images.navbarHome,
      label: LanguageProvider.translate('navbar', 'home'),
    ),
    BottomNaBarEntity(
      svgImage: Images.navbarCategories,
      label: LanguageProvider.translate('navbar', 'categories'),
    ),
    BottomNaBarEntity(
      svgImage: Images.navbarCart,
      label: LanguageProvider.translate('navbar', 'cart'),
    ),
    BottomNaBarEntity(
      svgImage: Images.navbarProfile,
      label: LanguageProvider.translate('navbar', 'profile'),
    ),
  ];

  void goToNavView() {
    currentIndex = 0;
    navPARU(const NavBarView());
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) {
    return currentIndex == index;
  }
}
