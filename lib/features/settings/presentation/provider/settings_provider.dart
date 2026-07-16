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
import '../../../address/presentation/providers/address_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/complete_info_provider.dart';
import '../../../favorite/presentation/providers/favorite_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../notification/presentation/provider/notifications_provider.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../../../wallet/presentation/provider/wallet_provider.dart';
import '../../domain/entities/profile_settings_entity.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/settings_usecases.dart';
import '../views/web_view.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsEntity? settingsEntity;
  final SettingsUseCases settingsUseCases;
  SettingsProvider(this.settingsUseCases);
  Future getSettings() async {
    Either<DioException, SettingsEntity> response = await settingsUseCases
        .getSettings();

    response.fold((l) => showToast(l.message ?? ""), (r) {
      settingsEntity = r;
      getData();
      notifyListeners();
    });
  }

  List<Map> accountSettings = [];
  List<Map> generalSettings = [];
  void getData() {
    SettingsProvider settingsProvider = Provider.of(Constants.globalContext(), listen: false,);
    LanguageProvider languageProvider = Provider.of(Constants.globalContext(), listen: false,);
    accountSettings = [
        {
          "image": AppImages.settingsProfile,
          "title": "edit_profile",
          "onTap": () {
            if(AuthProvider.isLogin()){
              Provider.of<CompleteInfoProvider>(Constants.globalContext(), listen: false,).goToCompleteInfoView(isEdit: true);
            }else{
              showGuestDialog();
            }
          },
        },
        {
          "image": AppImages.settingsLanguages,
          "title": "language",
          "onTap": () {
            Provider.of<LanguageProvider>(
              Constants.globalContext(),
              listen: false,
            ).showLanguageDialog();
          },
        },
        {
          "image": AppImages.settingsNotification,
          "title": "notifications",
          "onTap": () {
            Provider.of<NotificationProvider>(
              Constants.globalContext(),
              listen: false,
            ).goToNotificationPage();
          },
        },
        {
          "image": AppImages.settingsLocation,
          "title": "address",
          "onTap": () {
            if(!AuthProvider.isLogin()){
              showGuestDialog();
              return;
            }
            final addressProvider = Provider.of<AddressProvider>(
              Constants.globalContext(),
              listen: false,
            );
            addressProvider.goToAddressPage();
          },
        },
        {
          "image": AppImages.settingsWallet,
          "title": "wallet",
          "onTap": () {
            if(!AuthProvider.isLogin()){
              showGuestDialog();
              return;
            }
            final walletProvider = Provider.of<WalletProvider>(Constants.globalContext(), listen: false,);
            walletProvider.goToWalletPage();
          },
        },
        {
          "image": AppImages.settingsOrders,
          "title": "orders",
          "onTap": () {
            if(!AuthProvider.isLogin()){
              showGuestDialog();
              return;
            }
            final ordersProvider = Provider.of<OrderProvider>(Constants.globalContext(), listen: false,);
            ordersProvider.goToPage();
          },
        },
        {
          "image": AppImages.settingsFavorite,
          "title": "favorite",
          "onTap": () {
            if(!AuthProvider.isLogin()){
              showGuestDialog();
              return;
            }
            final favoriteProvider = Provider.of<FavoriteProvider>(Constants.globalContext(), listen: false,);
            favoriteProvider.goToPage();
          },
        },
      ];
    generalSettings = [
      {
        "image": AppImages.settingsSupport,
        "title": "support",
        "onTap": () {
          checkGuest((){
            Provider.of<TicketsProvider>(
              Constants.globalContext(),
              listen: false,
            ).goToTicketsPage();
          });
        },
      },
      {
        "image": AppImages.settingsTerms,
        "title": "terms",
        "onTap": () => goToTerms(),
      },
      {
        "image": AppImages.settingsTerms,
        "title": "about",
        "onTap": () {
          navP(
            WebViewPage(
              title: 'about',
              link: settingsProvider.settingsEntity?.aboutLink ?? "",
            ),
          );
        },
      },
      {
        "image": AppImages.settingsPrivacy,
        "title": "privacy_security",
        "onTap": () => goToPrivacy(),
      },

    ];
    notifyListeners();
  }
  void goToPrivacy() {
    navP(WebViewPage(title: 'privacy_policy', link: settingsEntity?.privacyLink ?? ""));
  }
  void goToTerms() {
    navP(WebViewPage(title: 'terms', link: settingsEntity?.termsLink ?? ""));
  }

}
