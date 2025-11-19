import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/user_case/product_use_case.dart';

class AddProductProvider extends ChangeNotifier {
  final ProductUseCase productUseCase;
  AddProductProvider(this.productUseCase);

  // --- Navigation ---
  void goToAddProductPage() {}

  // --- Images ---
  List<XFile> images = [];

  void setImages(List<XFile> pickedImages) {
    images.addAll(pickedImages);
    notifyListeners();
  }

  void deleteImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  void clearImages() {
    images.clear();
    notifyListeners();
  }

  // // --- Inputs ---
  // List<TextFieldModel> inputs = [
  //   TextFieldModel(
  //     controller: TextEditingController(),
  //     label: LanguageProvider.translate('global', 'product_name'),
  //     key: "product_name",
  //     max: 3,
  //     min: 1,
  //   ),
  //   TextFieldModel(
  //     controller: TextEditingController(),
  //     label: LanguageProvider.translate('global', 'product_details'),
  //     key: "product_details",
  //     max: 5,
  //     min: 4,
  //   ),
  //   TextFieldModel(
  //     controller: TextEditingController(),
  //     label: LanguageProvider.translate('global', 'product_price'),
  //     key: "product_price",
  //   ),
  // ];

  // --- CRUD Methods ---
  // Future<void> createProduct() async {
  //   loading();
  //   List imagesList = [];
  //   for (var image in images) {
  //     imagesList.add(await MultipartFile.fromFile(image.path));
  //   }
  //   Map<String, dynamic> data = {};
  //   // Prepare product data
  //   data.addAll({
  //     'name_ar': inputs[0].controller.text,
  //     'name_en': inputs[0].controller.text,
  //     'description_ar': inputs[1].controller.text,
  //     'description_en': inputs[1].controller.text,
  //     'price': inputs[2].controller.text,
  //     // 'product_id': 9,
  //     'images[]': imagesList,
  //   });

  //   // Convert selected images into a list of File paths
  //   if (images.isNotEmpty) {
  //     for (int i = 0; i < images.length; i++) {
  //       data['images[$i]'] = images[i].path;
  //     }
  //   }

  //   final result = await productUseCase.createProduct(data);
  //   result.fold(
  //     (l) => log('❌ ${l.message}'),
  //     (r) => log('✅ Product created: $r'),
  //   );

  //   navPARU(const MarketHomeView());
  //   clear();
  // }

  // Future<void> deleteProduct(String productId) async {
  //   loading();
  //   final result = await productUseCase.deleteProduct({
  //     'product_id': productId,
  //   });
  //   result.fold((l) => log(l.message.toString()), (r) => log(r.toString()));

  //   navPARU(const MarketHomeView());
  //   notifyListeners();
  // }

  // --- Utils ---
  void refresh() {
    notifyListeners();
  }

  void clear() {
    clearImages();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
