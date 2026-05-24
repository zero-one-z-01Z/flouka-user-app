import 'package:flouka/core/models/drop_down_class.dart';
import 'package:flutter/material.dart';

import '../../../language/presentation/provider/language_provider.dart';

class ProductQuantityProvider extends ChangeNotifier implements DropDownClass<int>{
  int?quantity;
  List<int> quantityList() {
    return List.generate(30, (index) => index + 1);
  }  @override
  String displayedName() {
    return "${quantity ?? LanguageProvider.translate('global', 'quantity')}";
  }

  @override
  String displayedOptionName(type) {
    return "${type}";
  }

  @override
  Widget? displayedOptionWidget(type) {
    return null;
  }

  @override
  Widget? displayedWidget() {
    return null;
  }

  @override
  List<int> list() {
    return quantityList();
  }

  @override
  Future onTap(int?data) async {
    quantity=data;
    notifyListeners();
  }

  @override
  int? selected() {
    return quantity;
  }

  @override
  value() {
    return quantity;
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