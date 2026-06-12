import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/dialog/guest_dialog.dart';
import 'package:flouka/features/tickets/presentation/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/dialog/snack_bar.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../notification/presentation/provider/notifications_provider.dart';
import '../../domain/entities/profile_settings_entity.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/settings_usecases.dart';
import '../views/web_view.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsEntity? settingsEntity;
  final SettingsUseCases settingsUseCases;

  void goToSettingsPage() {
    // navP(const SettingsView());
  }

  SettingsProvider(this.settingsUseCases) {
    _init(); // 🟢 Load everything automatically when created
  }

  /// Auto initialization logic
  Future<void> _init() async {
    // await getSettings(); // get settings from API
    // getData(); // prepare maps
    // Provider.of<AuthProvider>(Constants.globalContext(), listen: false).getProfile();
  }

  List<Map<String, dynamic>> socialAccounts = [];

  // 🟩 Get settings from API
  Future getSettings() async {
    Either<DioException, SettingsEntity> response = await settingsUseCases
        .getSettings();

    response.fold((l) => showToast(l.message ?? ""), (r) {
      settingsEntity = r;
      notifyListeners();
    });
  }

  // 🟩 Prepare static + dynamic data for settings list
  void getData() {
    SettingsProvider settingsProvider = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
  }

  void goToPrivacy() {
    navP(WebViewPage(title: 'privacy_policy', link: settingsEntity?.privacyLink ?? ""));
  }

  void goToTerms() {
    navP(WebViewPage(title: 'terms', link: settingsEntity?.termsLink ?? ""));
  }

  List<ProfileSettingsEntity> get settingsList => [
    // NewSettingsEntity(
    //   svgImage: Assets.images.settings.wallet.path,
    //   text: "wallet",
    //   onTap: () {
    //     Provider.of<WalletProvider>(
    //       Constants.globalContext(),
    //       listen: false,
    //     ).goToWalletPage();
    //   },
    // ),
    // NewSettingsEntity(
    //   svgImage: Assets.images.settings.language.path,
    //   text: "language",
    //   onTap: () {
    //     Provider.of<LanguageProvider>(
    //       Constants.globalContext(),
    //       listen: false,
    //     ).showLanguageDialog();
    //   },
    // ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsNotification,
      text: "notification",
      color: const Color(0xff11BD57),
      onTap: () {
        Provider.of<NotificationProvider>(
          Constants.globalContext(),
          listen: false,
        ).goToNotificationPage();
      },
    ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsLanguage,
      text: "language",
      color: const Color(0xff144B86),
      onTap: () {
        Provider.of<LanguageProvider>(
          Constants.globalContext(),
          listen: false,
        ).showLanguageDialog();
      },
    ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsSupport,
      text: "support",
      color: const Color(0xff254AA5),
      onTap: () {
        checkGuest((){
          Provider.of<TicketsProvider>(
            Constants.globalContext(),
            listen: false,
          ).goToTicketsPage();
        });
      },
    ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsPrivacyPolicy,
      text: "privacy_policy",
      color: const Color(0xff70C090),
      onTap: () {
        goToPrivacy();
      },
    ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsPrivacyPolicy,
      text: "terms",
      onTap: () {
        goToTerms();
      },
    ),
    ProfileSettingsEntity(
      svgImage: AppImages.settingsPrivacyPolicy,
      text: "about",
      onTap: () {
        navP(WebViewPage(title: 'about', link: settingsEntity?.aboutLink ?? ""));
      },
    ),

    // NewSettingsEntity(
    //   svgImage: Assets.images.settings.rating.path,
    //   text: "rate_app",
    //   onTap: () {},
    // ),
    if(AuthProvider.isLogin())...[
      ProfileSettingsEntity(
        svgImage: AppImages.settingsDeleteAccount,
        text: "delete_account",
        color: const Color(0xffF44336),
        onTap: () {
          Provider.of<AuthProvider>(
            Constants.globalContext(),
            listen: false,
          ).confirmDeleteAccount();
        },
      ),
      ProfileSettingsEntity(
        svgImage: AppImages.settingsDeleteAccount,
        text: "logout",
        color: const Color(0xffF44336),
        onTap: () {
          Provider.of<AuthProvider>(
            Constants.globalContext(),
            listen: false,
          ).showLogoutDialog();
        },
      ),
    ],
    if(!AuthProvider.isLogin())...[
      ProfileSettingsEntity(
        svgImage: AppImages.settingsDeleteAccount,
        text: "login",
        color: const Color(0xffF44336),
        onTap: () {
          Provider.of<AuthProvider>(
            Constants.globalContext(),
            listen: false,
          ).successLogout();
        },
      ),
    ],

  ];
}
