import 'package:flouka/core/models/text_field_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/text_form_field_validation.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../views/complete_info_view.dart';

class CompleteInfoProvider extends ChangeNotifier {
  void goToCompleteInfoView() {
    navP(const CompleteInfoView());
  }

  List<TextFieldModel> completeInfoTextFieldList = [
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
  ];
}
