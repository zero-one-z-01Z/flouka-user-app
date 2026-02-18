import 'package:flouka/features/address/presentation/providers/address_details_provider.dart';
import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flouka/features/address/presentation/providers/area_provider.dart';
import 'package:flouka/features/address/presentation/providers/map_provider.dart';
import 'package:flouka/features/address/presentation/providers/parts_provider.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/providers/filter_provider.dart';
import 'package:flouka/features/orders/presentation/provider/order_details_provider.dart';
import 'package:flouka/features/products/presentation/providers/brand_provider.dart';
import 'package:flouka/features/cart/presentation/providers/checkout_provider.dart';
import 'package:flouka/features/on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_bar_provider.dart';
import 'package:flouka/features/settings/presentation/provider/settings_provider.dart';
import 'package:flouka/features/tickets/presentation/provider/tickets_provider.dart';
import 'package:flouka/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/address/presentation/providers/city_provider.dart';
import 'features/auth/presentation/providers/complete_info_provider.dart';
import 'features/auth/presentation/providers/otp_provider.dart';
import 'features/cart/presentation/providers/cart_provider.dart';
import 'features/cart/presentation/providers/coupon_provider.dart';
import 'features/chat/presentation/providers/chat_provider.dart';
import 'features/filters/presentation/providers/filter_product_provider.dart';
import 'features/language/presentation/provider/language_provider.dart';
import 'features/offers_section/presentation/providers/offer_section_provider.dart';
import 'features/orders/presentation/provider/order_provider.dart';
import 'features/orders/presentation/provider/update_order_provider.dart';
import 'features/products/presentation/providers/home_products_provider.dart';
import 'features/products/presentation/providers/products_details_provider.dart';
import 'features/products/presentation/providers/products_provider.dart';
import 'features/reviews/presentation/providres/review_provider.dart';
import 'features/splash/provider/splash_provider.dart';
import 'features/stores/presentation/providers/reviews_provider.dart';
import 'features/stores/presentation/providers/stores_provider.dart';
import 'features/stories/presentation/provider/story_provider.dart';
import 'features/wallet/presentation/provider/wallet_provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child, required this.language});
  final Widget child;
  final LanguageProvider language;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => language),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AddressDetailsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => BannersProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CategoryProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => SubcategoryProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => BrandProvider()),
        ChangeNotifierProvider(create: (_) => StoresProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => ReviewsProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => StoryProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => TicketsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => AuthProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CompleteInfoProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CartProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CouponProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => HomeProductsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => AddressProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => AreaProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CityProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => OtpProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => OrderDetailsProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => PartsProvider()),
        ChangeNotifierProvider(create: (_) => UpdateOrderProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => FilterProductProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => OfferSectionProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => WalletProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => OrderProvider(sl.get())),
        ChangeNotifierProvider(
          create: (_) => ProductDetailsProvider(productUseCase: sl.get()),
        ),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: child,
    );
  }
}
