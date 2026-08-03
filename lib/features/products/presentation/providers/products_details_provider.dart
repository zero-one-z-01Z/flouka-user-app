import 'dart:developer';

import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/products/presentation/providers/product_quantity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/bottom_sheet_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../cart/presentation/providers/cart_operation_provider.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../domain/user_case/product_use_case.dart';
import '../pages/products_details_view.dart';
import 'product_variant_provider.dart' show ProductVariantProvider;

class ProductDetailsProvider extends ChangeNotifier implements ProviderStructureModel<ProductEntity> {
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
  // int variantIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();
  void changeImageIndex({required int index}){
    imageIndex = index;
    notifyListeners();
  }

  void animateToImage({required int index}){
    controller.animateToPage(index);
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
      if(productsIDs.isNotEmpty){
        productsIDs.removeLast();
      }
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

  List<ProductImage> images(){
    if(variantEntity()?.images.isNotEmpty??false){
      return variantEntity()!.images;
    }
    return  data!.images;
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    init();
    if (productsIDs.length == 1) {
      navP(const ProductsDetailsView(showAppBar: true,));
    }
  }
  void init([Map<String, dynamic>? inputs]){
    this.inputs = inputs;
    imageIndex=0;
    variants = {};
    Provider.of<ProductQuantityProvider>(Constants.globalContext(),listen: false).quantity = null;
    final productId = inputs?['product_id'];

    if (productId != null && (productsIDs.isEmpty || productsIDs.last != productId)) {
      productsIDs.add(productId);
    }
    refresh();
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

  Future createReport({required int id,required String type,required String comment}) async {
    Map<String,dynamic> data ={};
    data['id'] = id;
    data['type'] = type;
    data['message'] = comment;
    loading();
    Either<DioException, bool> response = await productUseCase.createReport(data);
    navPop();
    response.fold((l) {
    }, (r) {
      successDialog(then: (){
        navPop();
      });
      notifyListeners();
    });
  }

  void addToCart(ProductEntity product){
    print(product.haveVariant);
    print(product.stock);
    print(product.store);
    if(product.haveVariant||product.stock==null||product.store==null){
      init({
        'product_id': product.id,
        'is_similar': false,
      });
      bottomSheetDialog(ProductsDetailsView(showAppBar: false,));
    }else{
      final cartProvider = Provider.of<CartProvider>(Constants.globalContext(),listen: false);
      int stockId = product.stock!.id;
      cartProvider.addToCart(storeId: product.store!.id, quantity: 1,
          storeProductStockId: stockId);
    }
  }

}
