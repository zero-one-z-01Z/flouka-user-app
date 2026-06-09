import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/features/auth/presentation/views/profile_view.dart';
import 'package:flouka/features/cart/presentation/providers/cart_provider.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/view/categories_view.dart';
import 'package:flouka/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/helper_function/helper_function.dart';
import '../../../address/presentation/providers/city_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../banners/presentation/provider/banners_provider.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../categories/presentation/providers/categories_provider.dart';
import '../../../categories/presentation/providers/popular_categories_provider.dart';
import '../../../favorite/presentation/providers/favorite_provider.dart';
import '../../../filters/presentation/providers/filter_product_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../offers_section/presentation/providers/offer_section_provider.dart';
import '../../../products/presentation/providers/recommend_products_provider.dart';
import '../../../reels/presentation/providers/video_provider.dart';
import '../../../stores/presentation/providers/stores_provider.dart';
import '../../../stories/presentation/provider/story_provider.dart';
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

  List<BottomNaBarEntity> bottomNavigationBarItemEntity = [];

  void goToNavView({bool fromSplash = false}) async{
    currentIndex = 0;
    if(!fromSplash)loading();
    await getAllData();
    if(!fromSplash)navPop();
    bottomNavigationBarItemEntity = [
      BottomNaBarEntity(
        index: 0,
        svgImage: AppImages.navbarHome,
        label: LanguageProvider.translate('navbar', 'home'),
      ),
      BottomNaBarEntity(
        index: 1,
        svgImage: AppImages.navbarCategories,
        label: LanguageProvider.translate('navbar', 'categories'),
      ),
      BottomNaBarEntity(index: 2, svgImage: "", label: ""),
      BottomNaBarEntity(
        index: 3,
        svgImage: AppImages.navbarCart,
        label: LanguageProvider.translate('navbar', 'cart'),
      ),
      BottomNaBarEntity(
        index: 4,
        svgImage: AppImages.navbarProfile,
        label: LanguageProvider.translate('navbar', 'profile'),
      ),
    ];
    navPARU(const NavBarView());
  }

  Future getAllData()async{
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    await Future.wait([
      delay(500),
      Provider.of<BannersProvider>(Constants.globalContext(),listen: false,).getBanners(),
      Provider.of<FilterProductProvider>(Constants.globalContext(), listen: false,).getData(),
      Provider.of<StoresProvider>(Constants.globalContext(), listen: false,).getHomeStores(),
      Provider.of<OfferSectionProvider>(Constants.globalContext(), listen: false,).getData(),
      Provider.of<VideoProvider>(Constants.globalContext(), listen: false,).refresh(),
      Provider.of<StoryProvider>(Constants.globalContext(), listen: false).getData(),
      Provider.of<CategoryProvider>(Constants.globalContext(), listen: false,).getCategories(),
      Provider.of<PopularCategoriesProvider>(Constants.globalContext(), listen: false,).getCategories(),
      Provider.of<RecommendProductsProvider>(Constants.globalContext(), listen: false,).getRecommendedHomeData(),
      Provider.of<CartProvider>(Constants.globalContext(), listen: false).refresh(),
      Provider.of<FavoriteProvider>(Constants.globalContext(), listen: false).refresh(),
    ]);
  }

  void changeIndex(int index) {
    if (index == 3) {
      Provider.of<CartProvider>(Constants.globalContext(), listen: false).refresh();
    }
    if(index==1){
      Provider.of<SubcategoryProvider>(Constants.globalContext(),listen: false).clear();
    }
    currentIndex = index;
    notifyListeners();
  }

  bool isSelected(int index) {
    return currentIndex == index;
  }

}
