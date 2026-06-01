import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flutter/material.dart';
import '../views/create_review_page.dart';

class CreateRateProvider extends ChangeNotifier {
  List<TextFieldModel> rateFields = [];
  num rate=0;
  void setRate(num rate) {
    this.rate = rate;
    notifyListeners();
  }
  void gotoReviewPage({required int itemId, required int orderId, required bool product}) {
    rateFields = [
      TextFieldModel(
          key: "comment", label: "your_review",
          textInputType: TextInputType.text, max: 5,
          controller: TextEditingController()
      )
    ];
    navP(CreateReviewPage(itemId: itemId, orderId: orderId, product: product));
  }
}
