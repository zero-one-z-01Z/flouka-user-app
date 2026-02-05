import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/tickets/presentation/provider/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/dialog/snack_bar.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/new_settings_entity.dart';
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
    navP(WebViewPage(title: 'privacy', link: settingsEntity?.privacyLink ?? ""));
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
      svgImage: Images.settingsNotification,
      text: "notification",
      color: const Color(0xff11BD57),
      onTap: () {
        // Provider.of<NotificationProvider>(
        //   Constants.globalContext(),
        //   listen: false,
        // ).goToNotificationPage();
      },
    ),
    ProfileSettingsEntity(
      svgImage: Images.settingsLanguage,
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
      svgImage: Images.settingsSupport,
      text: "support",
      color: const Color(0xff254AA5),
      onTap: () {
        Provider.of<TicketsProvider>(
          Constants.globalContext(),
          listen: false,
        ).goToTicketsPage();
      },
    ),
    ProfileSettingsEntity(
      svgImage: Images.settingsPrivacyPolicy,
      text: "privacy_policy",
      color: const Color(0xff70C090),
      onTap: () {
        // goToPrivacy();
      },
    ),
    // NewSettingsEntity(
    //   svgImage: Assets.images.settings.rights.path,
    //   text: "terms",
    //   onTap: () {
    //     // goToTerms();
    //   },
    // ),
    // NewSettingsEntity(
    //   svgImage: Assets.images.settings.rating.path,
    //   text: "rate_app",
    //   onTap: () {},
    // ),
    ProfileSettingsEntity(
      svgImage: Images.settingsDeleteAccount,
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
      svgImage: Images.settingsDeleteAccount,
      text: "logout",
      color: const Color(0xffF44336),
      onTap: () {
        Provider.of<AuthProvider>(
          Constants.globalContext(),
          listen: false,
        ).showLogoutDialog();
      },
    ),
  ];
}
