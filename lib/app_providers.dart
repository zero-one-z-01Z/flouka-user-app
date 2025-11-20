import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/categories/presentation/providers/subcategory_provider.dart';
import 'package:flouka/features/categories/presentation/providers/filter_provider.dart';
import 'package:flouka/features/on_boarding/presentation/providers/on_boarding_provider.dart';
import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_provider.dart';
import 'package:flouka/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/providers/complete_info_provider.dart';
import 'features/auth/presentation/providers/otp_provider.dart';
import 'features/language/presentation/provider/language_provider.dart';
import 'features/splash/provider/splash_provider.dart';
import 'injection_container.dart';
import 'features/stores/presentation/providers/stores_provider.dart';

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
        ChangeNotifierProvider(create: (_) => BannersProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CategoryProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => SubcategoryProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => StoresProvider()),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => OtpProvider(sl.get())),
        ChangeNotifierProvider(create: (_) => CompleteInfoProvider()),
      ],
      child: child,
    );
  }
}
