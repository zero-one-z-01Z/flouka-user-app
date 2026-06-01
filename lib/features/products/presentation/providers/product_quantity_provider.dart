import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/models/drop_down_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/products/presentation/providers/product_variant_provider.dart';

import '../../../language/presentation/provider/language_provider.dart';
import 'products_details_provider.dart';

class ProductQuantityProvider extends ChangeNotifier implements DropDownClass<int>{
  int?quantity;
  List<int> quantityList() {
    ProductDetailsProvider productDetailsProvider =Provider.of<ProductDetailsProvider>(Constants.globalContext(),listen: false);
    final maxQuantity = productDetailsProvider.variantEntity()?.stock?.quantity??0;
    return List.generate(maxQuantity, (index) => index + 1);
  }

  void reset() {
    quantity = null;
    notifyListeners();
  }
  @override
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