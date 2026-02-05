import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/helper_function/image.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/text_form_field_validation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../views/complete_info_view.dart';

class CompleteInfoProvider extends ChangeNotifier {
  XFile? image;
  bool imageUpdated = false;

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

  // void updateImage(XFile image) {
  //   imageUpdated = true;
  //   this.image = image;
  //   notifyListeners();
  // }

  // void submitRegisterForm({required bool isCommercial}) {
  //   String nameError = '';

  //   if (image == null) {
  //     String? error = validateImage();
  //     nameError += '$error\n';
  //   }
  //   if ((isCommercial && commercialImage == null) || (!isCommercial && imageId == null)) {
  //     String? error = validateImageId(isCommercial: isCommercial);
  //     nameError += '$error\n';
  //   }

  //   for (var element in registerInputs) {
  //     if (element.controller.text.isEmpty) {
  //       String? error = element.validator!(element.controller.text);
  //       if (error != null && error.isNotEmpty) {
  //         nameError += '$error\n';
  //       }
  //     }
  //   }

  //   if (nameError.isEmpty) {
  //   } else {
  //     showToast(nameError.trim());
  //   }
  // }

  void goToCompleteInfoView() {
    navP(CompleteInfoView(isEdit: isEdit));
  }

  late List<TextFieldModel> completeInfoTextFieldList = [
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Email"),
      key: "email",
      controller: TextEditingController(),
      textInputType: TextInputType.emailAddress,
      validator: (value) => validateEmail(value),
    ),
    TextFieldModel(
      label: LanguageProvider.translate("inputs", "Name"),
      controller: TextEditingController(),
      textInputType: TextInputType.name,
      validator: (value) => validatePassword(value),
      key: "name",
    ),
    if (isEdit)
      TextFieldModel(
        label: LanguageProvider.translate("inputs", "phone"),
        controller: TextEditingController(),
        textInputType: TextInputType.number,
        validator: (value) => validatePhone(value),
        key: "phone",
      ),
  ];
}
