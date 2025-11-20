import 'dart:async';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/models/drop_down_class.dart';

class PartsProvider extends ChangeNotifier implements DropDownClass<int> {
  List<int> parts = [];
  int? selectedPart;

  Map<dynamic, dynamic> validation() {
    return {
      'value': selected() == null,
      "text": LanguageProvider.translate("validation", "select_city_first"),
    };
  }

  void clear() {
    parts.clear();
    notifyListeners();
  }

  Future getParts({required int numbers}) async {
    clear();
    parts = List.generate(numbers, (index) => index + 1);
  }

  @override
  String displayedName() {
    return "${selectedPart ?? LanguageProvider.translate('inputs', 'part')}";
  }

  @override
  String displayedOptionName(int type) {
    return "$type";
  }

  @override
  Widget? displayedOptionWidget(int? type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<int> list() {
    return parts;
  }

  @override
  Future onTap(int? data) async {
    selectedPart = data;
    notifyListeners();
  }

  @override
  int? selected() {
    return selectedPart;
  }

  @override
  value() {
    return selectedPart;
  }

  @override
  bool require() {
    return true;
  }

  @override
  String? titleName() {
    return null;
  }
}
