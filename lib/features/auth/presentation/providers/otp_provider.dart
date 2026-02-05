import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/usecases/auth_use_case.dart';
import '../views/otp_view.dart';
import 'auth_provider.dart';

class OtpProvider extends ChangeNotifier {
  final AuthUseCase authUsceCase;
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

  late TextEditingController otpController;

  Future<void> checkCode({bool isRegister = true}) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      Constants.globalContext(),
      listen: false,
    );

    Map<String, dynamic> data = {};
    data["otp"] = otpController.text.trim();
    data["phone"] = authProvider.loginTextFieldList[0].controller.text;

    loading();
    final result = await authUsceCase.checkCode(data);
    navPop();
    result.fold((l) => showToast(l.message!), (r) {
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

  Future<void> resendCode() async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      Constants.globalContext(),
      listen: false,
    );

    Map<String, dynamic> data = {};
    data["phone"] = authProvider.loginTextFieldList[0].controller.text;
    loading();
    final result = await authUsceCase.sendOtp(data);
    navPop();
    result.fold((l) => showToast(l.message!), (r) {
      startTimer();
    });
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
      navPop();
    });
  }
}
