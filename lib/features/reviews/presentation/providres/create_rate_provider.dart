import 'package:dio/dio.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flouka/features/orders/presentation/provider/order_details_provider.dart';
import 'package:flouka/features/reviews/presentation/providres/product_reviews_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../../../products/domain/user_case/product_use_case.dart';
import '../views/create_review_page.dart';

class CreateRateProvider extends ChangeNotifier {
  List<TextFieldModel> rateFields = [];
  ProductUseCase productUseCase;
  CreateRateProvider(this.productUseCase);
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
    reviewImages = [];
    rate = 0;
    navP(CreateReviewPage(itemId: itemId, orderId: orderId, product: product));
  }

  Future createReview({required int id ,required String type,required int orderId}) async {
    Map<String, dynamic> dataToUse = {};
    dataToUse['rate'] = rate;
    dataToUse['order_id'] = orderId;
    dataToUse['type'] = type;
    dataToUse['id'] = id;
    for(int i=0;i<rateFields.length;i++) {
      dataToUse[rateFields[i].key] = rateFields[i].controller.text;
    }
    for(int i=0;i<reviewImages.length;i++) {
      dataToUse['images[$i]'] = await MultipartFile.fromFile(reviewImages[i].path);
    }
    print(dataToUse);
    loading();
    final result = await productUseCase.createReview(dataToUse);
    navPop();
    result.fold((l) {
      showToast(l.message ?? '');
      }, (r) {
      navPop();
      OrderDetailsProvider orderDetailsProvider = Provider.of<OrderDetailsProvider>(Constants.globalContext(), listen: false);
      if(orderDetailsProvider.data != null){
        orderDetailsProvider.updateAfterRateSuccess(isProduct:type=="product" , id: id);
      }
      OrderProvider orderProvider = Provider.of<OrderProvider>(Constants.globalContext(), listen: false);
      int orderIndex = orderProvider.data?.indexWhere((element) => element.id == orderId) ?? -1;
      if(orderIndex != -1){
        orderProvider.updateAfterRateSuccess(isProduct: type=="product" , id: id, orderId: orderId);
      }

    });
  }

  List<dynamic> reviewImages = [];

  void addReviewImages(List<XFile> images) {
    reviewImages.addAll(images);
    notifyListeners();
  }

  void deleteReviewImage(int index) {
    reviewImages.removeAt(index);
    notifyListeners();
  }



}
