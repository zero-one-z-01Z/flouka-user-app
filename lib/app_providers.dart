import 'package:flouka/features/banners/presentation/provider/banners_provider.dart';
import 'package:flouka/features/categories/presentation/providers/categories_provider.dart';
import 'package:flouka/features/navbar/presentation/provider/nav_provider.dart';
import 'package:flouka/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/language/presentation/provider/language_provider.dart';
import 'features/splash/provider/splash_provider.dart';
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
        ChangeNotifierProvider(create: (_) => StoresProvider()),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
      ],
      child: child,
    );
  }
}
