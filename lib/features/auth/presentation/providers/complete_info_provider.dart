import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/text_form_field_validation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../views/complete_info_view.dart';

class CompleteInfoProvider extends ChangeNotifier {
  final provider = Provider.of<AuthProvider>(
    Constants.globalContext(),
    listen: false,
  );

  bool isEdit = false;

  void goToCompleteInfoView() {
    provider.userEntity == null
        ? navP(const CompleteInfoView(isEdit: false))
        : navP(const CompleteInfoView(isEdit: true));
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
      label: LanguageProvider.translate("inputs", "Firist Name"),
      controller: TextEditingController(),
      textInputType: TextInputType.name,
      validator: (value) => validatePassword(value),
      key: "first_name",
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
