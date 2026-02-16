import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flouka/features/auth/presentation/providers/otp_provider.dart';
import 'package:flouka/features/auth/presentation/views/login_view.dart';
import 'package:flouka/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/confirm_dialog.dart';
import '../../../../core/dialog/confirm_pop_up_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/api.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/prefs.dart';
import '../../../../core/helper_function/text_form_field_validation.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../navbar/presentation/provider/nav_bar_provider.dart';
import '../../domain/entities/social_auth_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/auth_use_case.dart';
import '../views/complete_info_view.dart';

class AuthProvider extends ChangeNotifier {
  UserEntity? userEntity;
  final AuthUseCase authUseCase;

  bool isUser = true;

  AuthProvider(this.authUseCase);

  void goToLoginView() {
    navPR(const LoginView());
  }

  void goToRegisterView() {
    navP(const RegisterView());
  }

  /// ----------- Login Logic -----------
  Future<void> socialLogin({required String loginFrom}) async {
    Map<String, dynamic> data = {};
    data['login_from'] = loginFrom;
    if (loginFrom == 'google') {
      data['name'] = googleUser!.displayName;
      data['email'] = googleUser!.email;
      data['image'] = googleUser!.photoUrl;
    }
    data['token'] = await FirebaseMessaging.instance.getToken() ?? "123";
    loading();
    final result = await authUseCase.socialLogin(data);
    navPop();
    result.fold((l) => showToast(l.message!), (r) {
      loginSuccess(r);
      userEntity = r;
    });
  }

  Future<void> deleteAccount() async {
    loading();
    await authUseCase.deleteAccount();
    await sharedPreferences.remove('token');
    navPop();
    ApiHandel.getInstance.updateHeader('');
    goToLoginView();
  }

  void loginSuccess(UserEntity userEntity) {
    this.userEntity = userEntity;
    if (userEntity.token != null) {
      ApiHandel.getInstance.updateHeader(userEntity.token!);
      sharedPreferences.setString('token', userEntity.token!);
    }
    if (userEntity.name == null || userEntity.name!.isEmpty) {
      navPARU(const CompleteInfoView(isEdit: false));
    } else {
      Provider.of<CartProvider>(Constants.globalContext(), listen: false).getData();

      Provider.of<NavBarProvider>(
        Constants.globalContext(),
        listen: false,
      ).goToNavView();
    }
  }

  void rebuild() {
    notifyListeners();
  }

  /// ----------- Google Login (new API v7) -----------
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  GoogleSignInAccount? googleUser;
  bool _isGoogleInitialized = false;

  Future<void> _initGoogle() async {
    if (!_isGoogleInitialized) {
      await _googleSignIn.initialize();
      _isGoogleInitialized = true;
    }
  }

  Future<void> appleLogin() async {
    try {
      String redirectUrl = "${Constants.domain}callback_sign_in_with_apple";
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: "com.zeroonez.raval.apple",
          redirectUri: Uri.parse(redirectUrl),
        ),
      );

      String yourToken = credential.identityToken!;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken); // email, sub
      String? email = decodedToken['email'];
      String appleIdentifier = decodedToken['sub'];
      String? name;
      if (credential.givenName != null) {
        name = '${credential.givenName} ${credential.familyName}';
      } else {
        if (decodedToken.containsKey('email')) {
          name = decodedToken['email'].toString().split('@').first;
        }
      }

      log("Apple user authenticated: $email");
      // Call socialLogin with the extracted Apple credentials
      await socialLogin(loginFrom: 'apple');
    } catch (error, stackTrace) {
      log("Apple login error: $error");
      log("Stack trace: $stackTrace");
      showToast("Apple login failed: $error");
    }
  }

  Future<void> googleLogin() async {
    await _initGoogle();
    try {
      await _googleSignIn.signOut();
      googleUser = await _googleSignIn.authenticate();
      log("message");
      socialLogin(loginFrom: 'google');
    } catch (error) {
      log(error.toString());
    }
  }

  Future getProfile() async {
    final result = await authUseCase.getProfile();
    result.fold(
      (l) {
        showToast(l.message!);
        if (userEntity == null) {
          goToLoginView();
        }
      },
      (r) {
        loginSuccess(r);
      },
    );
  }

  Future refreshToken() async {
    String token = sharedPreferences.getString('token')!;
    Map<String, dynamic> data = {'token': token};
    final result = await authUseCase.refreshToken(data);
    result.fold((l) => showToast(l.message!), (r) {
      sharedPreferences.setString('token', r);
      ApiHandel.getInstance.updateHeader(r);
    });
  }

  showLogoutDialog() {
    showPopUpDialog(
      title: LanguageProvider.translate('settings', 'logout'),
      onConfirm: () {
        final result = authUseCase.logout({
          "token": FirebaseMessaging.instance.getToken(),
        });
        successLogout();
      },
    );
  }

  List<TextFieldModel> loginTextFieldList = [
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Number"),
      key: "phone",
      controller: TextEditingController(),
      textInputType: TextInputType.phone,
      validator: (value) => validatePhone(value),
    ),
  ];

  List<TextFieldModel> registerTextFieldList = [
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Number"),
      controller: TextEditingController(),
      textInputType: const TextInputType.numberWithOptions(),
      validator: (value) => validatePhone(value),
      key: "phone",
    ),
  ];

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  OtpProvider otpProvider = Provider.of(Constants.globalContext(), listen: false);

  Future<void> sendOTP({bool isResend = false}) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    Map<String, dynamic> data = {};
    // data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
    for (var element in loginTextFieldList) {
      data[element.key] = element.controller.text.trim();
    }
    loading();
    final result = await authUseCase.sendOtp(data);
    navPop();
    result.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        if (isResend) {
          otpProvider.startTimer();
        } else {
          otpProvider.goToOTPView();
          otpProvider.startTimer();
        }
      },
    );
  }

  void successLogout() {
    sharedPreferences.remove('login');
    sharedPreferences.remove('phone');
    sharedPreferences.remove('token');
    userEntity = null;
    goToLoginView();
  }

  void confirmDeleteAccount() {
    confirmDialog(
      LanguageProvider.translate('settings', "delete_account"),
      LanguageProvider.translate('settings', "delete"),
      () {
        deleteAccount();
      },
    );
  }

  late List<SocialAuthEntity> authImages = [
    SocialAuthEntity(
      image: AppImages.apple,
      onTap: () => appleLogin(),
      text: "Apple",
    ),
    SocialAuthEntity(image: AppImages.facebook, onTap: () => {}, text: "Facebook"),
    SocialAuthEntity(
      image: AppImages.google,
      onTap: () => googleLogin(),
      text: "Google",
    ),
  ];
}
