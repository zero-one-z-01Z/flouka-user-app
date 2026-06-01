import 'package:flouka/features/settings/presentation/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/constants.dart';
import '../../../core/helper_function/prefs.dart';
import '../../address/presentation/providers/city_provider.dart';
import '../../auth/presentation/providers/auth_provider.dart';

class SplashProvider extends ChangeNotifier {

  void startApp() async {
    bool isFirstTime = !(sharedPreferences.getBool('onBoarding') ?? false);
    final context = Constants.globalContext();
    var auth = Provider.of<AuthProvider>(context, listen: false);
    String? isLoggedIn = sharedPreferences.getString('token');
    await Future.wait([
      Provider.of<CityProvider>(Constants.globalContext(), listen: false,).getCities(),
      Provider.of<SettingsProvider>(Constants.globalContext(), listen: false,).getSettings(),
    ]);


    if (isLoggedIn != null) {
        auth.getProfile(fromSplash: true);
      } else {
        auth.goToLoginView();
    }
  }
}
