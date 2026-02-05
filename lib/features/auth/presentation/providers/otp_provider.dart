import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/usecases/user_usecases.dart';
import '../views/otp_view.dart';
import 'auth_provider.dart';

class OtpProvider extends ChangeNotifier {
  final AuthUseCase authUsceCase;
  late String theHashCode;
  Timer? timer;
  int counter = 60;
  late bool isEdit;

  void startTimer() {
    counter = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (e) {
      if (timer?.isActive ?? false) {
        try {
          counter--;
          notifyListeners();
        } catch (e) {
          debugPrint("$e");
        }
      }
      if (counter == 0) {
        e.cancel();
      }
    });
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();
  }

  OtpProvider(this.authUsceCase);

  void goToOTPView() {
    otpController = TextEditingController();
    navP(const OTPView());
  }

  final GlobalKey<FormState> createAccountFormKey = GlobalKey<FormState>();

  String otpNumber = "";

  late TextEditingController otpController;

  Future<void> checkCode({bool isRegister = true}) async {
    Map<String, dynamic> data = {};
    data["hashed_code"] = theHashCode;
    data["code"] = otpController.text.trim();

    loading();
    final result = await authUsceCase.checkCode(data);
    navPop();
    result.fold((l) => showToast(l.message!), (r) {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        Constants.globalContext(),
        listen: false,
      );
      authProvider.loginSuccess(r);
    });
  }

  String sendCode(value) {
    if (counter == 0) {
      return '';
    } else {
      return "${LanguageProvider.translate("login", "after")} $value ${LanguageProvider.translate("time", "sec")}";
    }
  }

  Future<void> updateProfile() async {
    Map<String, dynamic> data = {};
    loading();
    final result = await authUsceCase.updateProfile(data);
    navPop();
    result.fold((l) => showToast(l.message!), (r) {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        Constants.globalContext(),
        listen: false,
      );
      authProvider.loginSuccess(r);
      // authProvider.userEntity = r;
      navPop();
    });
  }
}
