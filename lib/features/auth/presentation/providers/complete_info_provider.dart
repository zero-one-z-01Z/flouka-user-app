// ignore_for_file: unused_import

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flouka/features/auth/domain/usecases/auth_use_case.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/image.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/text_form_field_validation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/user_entity.dart';
import '../views/complete_info_view.dart';

class CompleteInfoProvider extends ChangeNotifier {
  XFile? image;
  bool imageUpdated = false;
  final AuthUseCase authUseCase;

  CompleteInfoProvider(this.authUseCase);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthProvider get authProvider =>
      Provider.of(Constants.globalContext(), listen: false);
  bool isEdit = false;

  Future selectImage() async {
    FocusScope.of(Constants.globalContext()).unfocus();
    XFile? image = await chooseImage();
    if (image != null) {
      updateImage(image);
    }
  }

  void updateImage(XFile image) {
    imageUpdated = true;
    this.image = image;
    notifyListeners();
  }

  ImageProvider showUserImage() {
    if (image != null) {
      return FileImage(File(image!.path));
    }

    if (authProvider.userEntity?.image != null &&
        authProvider.userEntity!.image!.isNotEmpty) {
      return CachedNetworkImageProvider(authProvider.userEntity!.image!);
    }

    return const AssetImage(AppImages.logo);
  }

  void updateProfileButton() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Map<String, dynamic> data = {};
    for (var element in completeInfoTextFieldList) {
      if (element.controller.text != '') {
        data[element.key] = element.controller.text;
      }
    }
    if (image != null && imageUpdated) {
      data['image'] = await MultipartFile.fromFile(image!.path);
    }

    // data["token"] = await FirebaseMessaging.instance.getToken() ?? "123";
    loading();
    Either<DioException, UserEntity> login = await authUseCase.updateProfile(data);
    navPop();
    login.fold(
      (l) {
        showToast(l.message!);
      },
      (r) async {
        authProvider.loginSuccess(r);
        authProvider.rebuild();
      },
    );
  }

  void goToCompleteInfoView() {
    navP(CompleteInfoView(isEdit: isEdit));
  }

  late List<TextFieldModel> completeInfoTextFieldList = [
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Email"),
      key: "email",
      controller: TextEditingController(text: authProvider.userEntity?.email),
      textInputType: TextInputType.emailAddress,
      validator: (value) => validateEmail(value),
    ),
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Name"),
      controller: TextEditingController(text: authProvider.userEntity?.name),
      textInputType: TextInputType.name,
      validator: (value) => validatePassword(value),
      key: "name",
    ),
    // if (isEdit)
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "phone"),
      controller: TextEditingController(text: authProvider.userEntity?.phone),
      textInputType: TextInputType.number,
      readOnly: true,
      validator: (value) => validatePhone(value),
      key: "phone",
    ),
  ];
}
