import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/user_case/product_use_case.dart';
import '../pages/products_details_view.dart';

class ProductDetailsProvider extends ChangeNotifier
    implements ProviderStructureModel<ProductEntity> {
  @override
  ProductEntity? data;

  @override
  Map? inputs;


  Map<int,int> variants = {};
  // bool isLoading = false;

  final ProductUseCase productUseCase;

  List<int> productsIDs = [];
  int quantity = 1;
  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }
  void decrementQuantity() {
    quantity--;
    notifyListeners();
  }

  ProductDetailsProvider({required this.productUseCase});

  @override
  void clear() {
    data = null;
    // colors = [];
    // sizes = [];
    notifyListeners();
  }

  int imageIndex = 0;
  int variantIndex = 0;
  void changeImageIndex({required int index}){
    imageIndex = index;
    notifyListeners();
  }

  @override
  Future getData() async {
    if (inputs == null || inputs!['product_id'] == null) return;
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    Map<String, dynamic> dataToUse = {
      'product_id': productsIDs.isEmpty ? inputs!['product_id'] : productsIDs.last,
    };
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }

    // isLoading = true;data = null;
    notifyListeners();
    final result = await productUseCase.getProductDetails(dataToUse);
    result.fold((l) {
      showToast(l.message ?? '');
      log(l.message ?? '');
    }, (
      productDetails,
    ) {
      data = productDetails;
      notifyListeners();

    });

  }

  void backToLastProduct() {
    if (productsIDs.length > 1) {
      productsIDs.removeLast();

      inputs?['product_id'] = productsIDs.last;

      refresh();
    } else {
      productsIDs.clear();
      navPop();
    }
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    this.inputs = inputs;
    imageIndex=0;
    final productId = inputs?['product_id'];

    if (productId != null &&
        (productsIDs.isEmpty || productsIDs.last != productId)) {
      productsIDs.add(productId);
    }

    refresh();

    // افتح الصفحة أول مرة فقط
    if (productsIDs.length == 1) {
      navP(const ProductsDetailsView());
    }
  }


  @override
  Future refresh() async {
    clear();
    await getData();
  }

  List<Color> colorsList = [Colors.red, Colors.green, Colors.blue, Colors.purple];
  late Color selectedColor = colorsList.first;

  void onColorChange(Color newColor) {
    if (selectedColor == newColor) return;
    selectedColor = newColor;
    notifyListeners();
  }

  bool isColorSelected(Color color) {
    return selectedColor == color;
  }

  void rebuild(){
    notifyListeners();
  }

  // ColorEntity? colorEntity;
  // onColorChange(ColorEntity newColor) {
  //   if (colorEntity?.id == newColor.id) {
  //     return;
  //   }
  //   sizeEntity = null;
  //   sizes = [];
  //   for (var elemnt in data!.stock!.where(
  //     (element) => element.colorId == newColor.id,
  //   )) {
  //     int index = sizes.indexWhere((element) => element.id == elemnt.sizeId);
  //     if (index == -1) {
  //       sizes.add(elemnt.sizeEntity!);
  //     }
  //   }
  //   colorEntity = newColor;
  //   notifyListeners();
  // }

  // bool isColorSelected(ColorEntity color) {
  //   return colorEntity?.id == color.id;
  // }

  // bool isSizeAvialalbe(SizeEntity newSize) {
  //   return data!.stock!.any(
  //     (element) =>
  //         element.sizeId == newSize.id &&
  //         element.colorId == colorEntity!.id &&
  //         element.stock! > 0,
  //   );
  // }

  // SizeEntity? sizeEntity;
  // onSizeChange(SizeEntity newSize) {
  //   if (isSizeAvialalbe(newSize)) {
  //     sizeEntity = newSize;
  //     notifyListeners();
  //   }
  // }

  // bool isSizeSelected(SizeEntity size) {
  //   return sizeEntity?.id == size.id;
  // }

  // updateFavourite(bool isFavorite) {
  //   if (data == null) return;
  //   data!.isFavorite = isFavorite;
  //   notifyListeners();
  // }

  // List<ColorEntity> colors = [];
  // List<SizeEntity> sizes = [];

  // List<ImageEntity> allImages(){
  //   List<ImageEntity> images = List.from(data!.images!);
  //   int index = data?.stock?.indexWhere((element) => element.id == colorEntity?.id && element.image!=null)??-1;
  //   if(index!=-1){
  //     images.insert(0,ImageEntity(id: 0, image: data!.stock![index].image!));
  //   }
  //   return images;
  // }
}

// product details entity => List<StockEntity>
// loop data in stock entity => size stock entity => colors stock entity
// product stock entity
